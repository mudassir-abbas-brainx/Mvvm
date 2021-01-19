//
//  AFService.swift
//  Git Testing
//
//  Created by BrainX Technologies on 19/01/2021.
//

import UIKit
import Alamofire
import MediaPlayer

//typealias SuccessBlock = (_ response: DataResponse<Data>) -> Void
typealias FailureBlock = (_ response: Error) -> Void

class ALFWebService: NSObject {
    static let sharedInstance = ALFWebService()
    private let headers:HTTPHeaders =  ["Authorization": "M<6%sDqtwP.}",
                            "Content-Type": "application/json"]
    
    /****************************  ***********************************/
    /******************* Method with PARAMS **********************/
    /****************************  ***********************************/
//    func callApi(url:String?,params:[String:Any]?,method: HTTPMethod,success:@escaping SuccessBlock,fail: @escaping FailureBlock){
//
//        let manager = AF
//        let url = "\()"
//        manager.request(URL(string: url ?? "")!, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).responseData { (response) in
//            print(response)
//            switch response.result {
//            case .success:
//                success(response)
//            case .failure(let error):
//                fail(error)
//            }
//        }
//    }
    
}

