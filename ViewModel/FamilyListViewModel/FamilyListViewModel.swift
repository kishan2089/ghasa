//
//  FamilyListViewModel.swift
//  Ghasa Gam
//
//  Created by Kishan Kachhadiya on 15/12/22.
//

import Foundation
import Alamofire

class FamilyListViewModel {
    
    var arrFamilyList = [Detail]()
    weak var vc: UserlistVC?
    
//    func getAllFamilyfolderList() {
//        AF.request("\(URL_FAMILY_FOLDER)").response { response in
//            if let data = response.data {
//                do{
//                    let userResponse = try JSONDecoder().decode([Detail].self, from: data)
//                    for modelFamilyList in userResponse {
//                        self.arrFamilyList.append(modelFamilyList)
//                        DispatchQueue.main.async {
//                            self.vc?.clvFamilyGrop.reloadData()
//                        }
//                    }
//                    print(userResponse)
//                }catch let err{
//                    print(err.localizedDescription)
//                }
//            }
//        }
//        
//    }
//    
//    
//    
//    func getFamilyList() {
//        URLSession.shared.dataTask(with: URL(string: "\(URL_FAMILY_FOLDER)")!) { data, response, error in
//            if error == nil {
//                if let data = data {
//                    do{
//                        let userResponse = try JSONDecoder().decode([Detail].self, from: data)
//                        for modelFamilyList in userResponse {
//                            self.arrFamilyList.append(modelFamilyList)
//                        }
//                        print(userResponse)
//                    }catch let err{
//                        print(err.localizedDescription)
//                    }
//                }
//                
//            } else {
//                print(error?.localizedDescription)
//            }
//        }.resume()
//    }
    
    
    
}
