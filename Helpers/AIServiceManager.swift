//
//  AIServiceManager.swift
//  Ghasa Gam
//
//  Created by Kishan Kachhadiya on 15/12/22.
//

import Foundation
import Alamofire

public class AIServiceManager: NSObject {
    

    func apiCalling(URL: String , parameter: [String: Any], method: HTTPMethod, encoding: ParameterEncoding, success: @escaping(([String: Any]) -> ()), fail:@escaping((String) -> ())) {
        
//        if !isConnectedToInternet()
//        {
//            SHOW_INTERNET_ALERT()
//            return
//        }
//
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiMzA1OTY1ZmEwMzcwOGJlZDdmYjg2YTE0M2FkNmMxMGJlOGNlYTM5N2Y2ODNjOTI5YzczMjcyOTYwOTliMDUxOGE0NTZlMTNmMmY0MTcwODgiLCJpYXQiOjE2NzEwNDMyODIuNjkyMzQ3LCJuYmYiOjE2NzEwNDMyODIuNjkyMzUyLCJleHAiOjE3MDI1NzkyODIuNjgyMDIxLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.JiXL2f9NnJZQ6RJ3DfZavgNk4ILEzRMMTFPMGz48fZ-tu7xR8dhZpSrEoLAGwz_KUGblbTN2LE3iATWj2aEiCj1khvyBP8Ds2tczUrufz8jNixOF3hbJZA78dK9AgLWZUxxTuPkwXJRNmOkuby_YucgdrA4Ih_l_ZpM1IGp9Bql8wZHjphSa4tMOIyQMTI9Mn4QYaRs2mDL7ySbdRAfPGU7I6Y6Hz70CsoBRfA0_VsQoO3kejBNuvuFOY9giC09Ums-eV0x13caw7B8q7EVPCMP89BAtZMuIIHdeWpr8GnCykZrqhT5jyBPEdnaVPRHq2oHXoNpSHM06hYDeIPg4-iV8_zhA8HpvMbg7AgFRytbLRKO-qHp9wDds1A7aAF7_JlPpyQoGURh7_o7jlFOt6fV1G5stCVI7ZOcqw9WRe83hGJS_TZDzkKwmYJqoXvvFrpKUQaVYnGB3_OEvxKFKCL9fu7Jzlt45gCHfJKhizMSHGmo2TuiQQE906_bRXNaFbCB3ADrW9UuCWH9dyhgR3xrd1FBeDqfZoH6ymnPAgfl3iknbyBd1OR0vSUI_1TyDqQdViHcfKBVYuKL_FI0Jj1YK4UJc9lwiTLqTpWSxSuYjQVu0n0KVusaUOF8nKRVU9DKGRhirXmNhkRSODPUcGe_7NMCnU46sFLfp5qVrf1I"
    
        
//        if let loginResponseStr = UserDefaults.standard.object(forKey: USER_SIGNUP_RESPONSE) as? String {
//            if loginResponseStr != "" {
//                headers["Authorization"] = loginResponseStr
//            }
//        }
       
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization" : "Bearer " + token
        ]
        
        print("headers:- \(headers)")
               print("param:- \(parameter)")
               print("URL:- \(URL)")
        
        AF.request(URL, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        
                        if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] {
                            print(json)
                            success(json)
                           
                            
                        }
                       /* guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            fail("error")
                            return
                        }
                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                            print("Error: Could print JSON in String")
                            fail("error")
                            return
                        }*/
                        
                        //     let loginResponse = try? JSONDecoder().decode(Detail.self, from: data)
                        
                     //   debugPrint(loginResponse)
                       
                        
                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        fail("error")
                        return
                    }
                case .failure(let error):
                    print(error)
                fail("error")
            }
        }
    }
}


extension AIServiceManager {
    
    static let token =  "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiMzA1OTY1ZmEwMzcwOGJlZDdmYjg2YTE0M2FkNmMxMGJlOGNlYTM5N2Y2ODNjOTI5YzczMjcyOTYwOTliMDUxOGE0NTZlMTNmMmY0MTcwODgiLCJpYXQiOjE2NzEwNDMyODIuNjkyMzQ3LCJuYmYiOjE2NzEwNDMyODIuNjkyMzUyLCJleHAiOjE3MDI1NzkyODIuNjgyMDIxLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.JiXL2f9NnJZQ6RJ3DfZavgNk4ILEzRMMTFPMGz48fZ-tu7xR8dhZpSrEoLAGwz_KUGblbTN2LE3iATWj2aEiCj1khvyBP8Ds2tczUrufz8jNixOF3hbJZA78dK9AgLWZUxxTuPkwXJRNmOkuby_YucgdrA4Ih_l_ZpM1IGp9Bql8wZHjphSa4tMOIyQMTI9Mn4QYaRs2mDL7ySbdRAfPGU7I6Y6Hz70CsoBRfA0_VsQoO3kejBNuvuFOY9giC09Ums-eV0x13caw7B8q7EVPCMP89BAtZMuIIHdeWpr8GnCykZrqhT5jyBPEdnaVPRHq2oHXoNpSHM06hYDeIPg4-iV8_zhA8HpvMbg7AgFRytbLRKO-qHp9wDds1A7aAF7_JlPpyQoGURh7_o7jlFOt6fV1G5stCVI7ZOcqw9WRe83hGJS_TZDzkKwmYJqoXvvFrpKUQaVYnGB3_OEvxKFKCL9fu7Jzlt45gCHfJKhizMSHGmo2TuiQQE906_bRXNaFbCB3ADrW9UuCWH9dyhgR3xrd1FBeDqfZoH6ymnPAgfl3iknbyBd1OR0vSUI_1TyDqQdViHcfKBVYuKL_FI0Jj1YK4UJc9lwiTLqTpWSxSuYjQVu0n0KVusaUOF8nKRVU9DKGRhirXmNhkRSODPUcGe_7NMCnU46sFLfp5qVrf1I"
    
  class  func postMethod() {
        let params: Parameters = [
            "last_name": "rajpara"
        ]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization" : "Bearer " + token
        ]
        
        
        AF.request("https://dhasagam.com/public/api/familylist", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Cannot convert data to JSON object")
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            return
                        }
                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                            print("Error: Could print JSON in String")
                            return
                        }
                
                        print(prettyPrintedJson)
                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        return
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
