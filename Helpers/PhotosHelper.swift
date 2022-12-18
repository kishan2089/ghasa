//
//  PhotosHelper.swift
//  Video Maker
//
//  Created by Sunil Zalavadiya on 22/06/22.
//

import Foundation
import Photos
import UIKit

class PhotosHelper {
    
    lazy var imageManager: PHCachingImageManager = {
        return PHCachingImageManager()
    }()
    internal var limitMode: Bool = false
    internal var assetCollections: [PHFetchResult<PHAssetCollection>] = []
    internal var albums: PHFetchResult<PHCollection>? = nil
    
    deinit {
        //        print("deinit TLPhotoLibrary")
    }
    
    @discardableResult
    func livePhotoAsset(asset: PHAsset, size: CGSize = CGSize(width: 720, height: 1280), progressBlock: Photos.PHAssetImageProgressHandler? = nil, completionBlock:@escaping (PHLivePhoto,Bool)-> Void ) -> PHImageRequestID {
        let options = PHLivePhotoRequestOptions()
        options.deliveryMode = .opportunistic
        options.isNetworkAccessAllowed = true
        options.progressHandler = progressBlock
        let scale = min(UIScreen.main.scale,2)
        let targetSize = CGSize(width: size.width*scale, height: size.height*scale)
        let requestID = self.imageManager.requestLivePhoto(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: options) { (livePhoto, info) in
            let complete = (info?["PHImageResultIsDegradedKey"] as? Bool) == false
            if let livePhoto = livePhoto {
                completionBlock(livePhoto,complete)
            }
        }
        return requestID
    }
    
    @discardableResult
    func videoAsset(asset: PHAsset, size: CGSize = CGSize(width: 720, height: 1280), progressBlock: Photos.PHAssetImageProgressHandler? = nil, completionBlock:@escaping (AVPlayerItem?, [AnyHashable : Any]?) -> Void ) -> PHImageRequestID {
        let options = PHVideoRequestOptions()
        options.isNetworkAccessAllowed = true
        options.deliveryMode = .automatic
        options.progressHandler = progressBlock
        let requestID = self.imageManager.requestPlayerItem(forVideo: asset, options: options, resultHandler: { playerItem, info in
            completionBlock(playerItem,info)
        })
        return requestID
    }
    
    @discardableResult
    func imageAsset(asset: PHAsset, size: CGSize = CGSize(width: 160, height: 160), options: PHImageRequestOptions? = nil, completionBlock:@escaping (UIImage,Bool)-> Void ) -> PHImageRequestID {
        var options = options
        if options == nil {
            options = PHImageRequestOptions()
            options?.isSynchronous = false
            options?.resizeMode = .exact
            options?.deliveryMode = .opportunistic
            options?.isNetworkAccessAllowed = true
        }
        let scale = min(UIScreen.main.scale,2)
        let targetSize = CGSize(width: size.width*scale, height: size.height*scale)
        let requestID = self.imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: options) { image, info in
            let complete = (info?["PHImageResultIsDegradedKey"] as? Bool) == false
            if let image = image {
                completionBlock(image,complete)
            }
        }
        return requestID
    }
    
    func cancelPHImageRequest(requestID: PHImageRequestID) {
        self.imageManager.cancelImageRequest(requestID)
    }
    
    @discardableResult
    class func cloudImageDownload(asset: PHAsset, size: CGSize = PHImageManagerMaximumSize, progressBlock: @escaping (Double) -> Void, completionBlock:@escaping (UIImage?)-> Void ) -> PHImageRequestID {
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        options.isNetworkAccessAllowed = true
        options.deliveryMode = .opportunistic
        options.version = .current
        options.resizeMode = .exact
        options.progressHandler = { (progress,error,stop,info) in
            progressBlock(progress)
        }
        let requestID = PHCachingImageManager().requestImageDataAndOrientation(for: asset, options: options) { (imageData, dataUTI, orientation, info) in
            if let data = imageData,let _ = info {
                completionBlock(UIImage(data: data))
            }else{
                completionBlock(nil)//error
            }
        }
        return requestID
    }
    
    @discardableResult
    class func fullResolutionImage(asset: PHAsset) -> UIImage? {
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        options.resizeMode = .none
        options.isNetworkAccessAllowed = true
        options.version = .current
        var image: UIImage? = nil
        _ = PHCachingImageManager().requestImageDataAndOrientation(for: asset, options: options) { (imageData, dataUTI, orientation, info) in
            if let data = imageData {
                image = UIImage(data: data)
            }
        }
        return image
    }
    
    @discardableResult
    class func fetchOriginalImage(asset: PHAsset, size: CGSize = PHImageManagerMaximumSize, progressBlock: @escaping (Double) -> Void, completionBlock:@escaping (UIImage?)-> Void ) -> PHImageRequestID {
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        options.isNetworkAccessAllowed = true
        options.deliveryMode = .highQualityFormat
        options.version = .current
        options.resizeMode = .exact
        
        options.progressHandler = { (progress,error,stop,info) in
            progressBlock(progress)
        }
        
        let requestID = PHCachingImageManager().requestImage(for: asset, targetSize: size, contentMode: .aspectFit, options: options) { (image, userInfo) in
            DLog("userInfo = ", userInfo)
            let isDegraded = (userInfo?[PHImageResultIsDegradedKey] as? Bool) ?? false
            if isDegraded {
                return
            }
            if let image = image {
                completionBlock(image)
            } else {
                completionBlock(nil)
            }
        }
        return requestID
    }
    
    @discardableResult
    class func fetchOriginalVideo(asset: PHAsset, progressBlock: @escaping (Double) -> Void, completionBlock:@escaping (AVAsset?)-> Void ) -> PHImageRequestID {
        let options = PHVideoRequestOptions()
        options.isNetworkAccessAllowed = true
        options.deliveryMode = .highQualityFormat
        options.version = .current
        options.progressHandler = { (progress,error,stop,info) in
            progressBlock(progress)
        }
        
        let requestID = PHCachingImageManager().requestAVAsset(forVideo: asset, options: options) { videoAsset, audioMix, userInfo in
            DLog("userInfo = ", userInfo)
            let isDegraded = (userInfo?[PHImageResultIsDegradedKey] as? Bool) ?? false
            if isDegraded {
                return
            }
            if let videoAsset = videoAsset {
                completionBlock(videoAsset)
            } else {
                completionBlock(nil)
            }
        }
        return requestID
    }
}
