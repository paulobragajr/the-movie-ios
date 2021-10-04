//
//  RequestServiceUrl.swift
//  the-movie-ios
//
//  Created by Junior Braga on 11/05/21.
//

import Foundation
import Alamofire

typealias handlerObjectService = (Any?) -> Swift.Void

class RequestServiceUrl {
    static let shared = RequestServiceUrl()
    
    func getFilms(page:Int ,handler: handlerObjectService? = nil) {
        let params = ["page":page]
        Connection.request("/movie/popular", method: .get, parameters: nil,urlParameters: params) { (dataResponse) in
            if let handler = handler { handler(dataResponse) }
        }
    }
}
