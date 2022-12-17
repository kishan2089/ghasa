//
//  FamilyDetailsViewModel.swift
//  Ghasa Gam
//
//  Created by Kishan Kachhadiya on 15/12/22.
//

import Foundation
import Alamofire

class FamilyDetailsViewModel {
    
    var arrFamilyInfo = [Detail]()
    weak var vc: FamilyListDetailsVC?
    
    
    
    func getFamilyInfoList() {
        AIServiceManager().apiCalling(URL: URL_FAMILY_LIST, parameter: ["last_name": "rajpara"], method: .post,encoding: URLEncoding.default) { response in

            print("resetUser API response = \(response)")
            if let data = response["data"] as? [String: Any], let detail = data["detail"] as? [[String: Any]] {
               debugPrint(data)
            }
            self.vc?.tblContact.reloadData()
            //self.userDataApi()
        } fail: { errorMsg in
            print(errorMsg)
        }
    }
    
    
}
