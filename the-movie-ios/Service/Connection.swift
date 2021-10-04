//
//  Connection.swift
//  the-movie-ios
//
//  Created by Junior Braga on 11/05/21.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias handlerResponseObject = (NSDictionary?) -> Swift.Void
//typealias handlerResponseJSON = (Alamofire.DataResponse<Any, <#Failure: Error#>>) -> Swift.Void

class Connection {
    
    
    static let shared = Connection()
    
    var headers : HTTPHeaders?
    var cookies = [HTTPCookie]()
    
    static let URL_BASE = "https://api.themoviedb.org/3"
   
    /// Request Method
    ///
    /// - Parameters:
    ///   - url: request link
    ///   - method: HTTP Method
    ///   - parameters: Dictionary representation
    ///   - dataResponseJSON: Handler to completion
    static func request(_ url : String, method : HTTPMethod, parameters : [String : Any]?, urlParameters: [String:Any]? = nil, dataResponseJSON: @escaping handlerResponseObject) {
        
        let urlConnection = createUrl(from: "\(URL_BASE)\(url)?api_key=b425891fefac82f79ed3543140a977ca", parameters: urlParameters ?? ["":""])

        AF.request(urlConnection, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in

            if response.response?.statusCode == 403 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "expiredSessionObserver"), object: nil)
            }
            
            var responseJson = NSDictionary()
            
            switch response.result {
                case .success(let JSON):
                    print("Success with JSON: \(JSON)")
                    responseJson = JSON as! NSDictionary
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            
            print("URL: \(url)\nJSON Response: \(responseJson)\n")
            dataResponseJSON(responseJson)
        }
    }
    
  
    static func createUrl(from string: String, parameters: [String:Any]) -> String {
        var stringUrl = string
    
        for parameter in parameters {
            stringUrl.append("&\(parameter.key)=\(parameter.value)")
        }
        return stringUrl
    }
}

