//
//  Connection.swift
//  the-movie-ios
//
//  Created by Junior Braga on 11/05/21.
//

import UIKit
import Alamofire

typealias handlerResponseObject = (Any?) -> Swift.Void

class Connection {
    
    
    static let shared = Connection()
    
    var headers : HTTPHeaders?
    var cookies = [HTTPCookie]()
    
   
    /// Request Method
    ///
    /// - Parameters:
    ///   - url: request link
    ///   - method: HTTP Method
    ///   - parameters: Dictionary representation
    ///   - dataResponseJSON: Handler to completion
    static func request(_ url : String, method : HTTPMethod, parameters : [String : Any]?, dataResponseJSON: @escaping handlerResponseObject) {
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            print("URL: \(url)\nJSON Response: \(response)\n")

            if response.response?.statusCode == 403 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "expiredSessionObserver"), object: nil)
            }
            dataResponseJSON(response)
        }
    }
}

