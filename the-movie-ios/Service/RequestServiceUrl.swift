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
    
    func getFilms(handler: handlerObjectService? = nil) {
        Connection.request("https://swapi.dev/api/films", method: .get, parameters: nil) { (dataResponse) in
            if let handler = handler { handler(dataResponse) }
        }
    }
}
