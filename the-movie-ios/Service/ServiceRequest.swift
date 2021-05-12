//
//  ServiceRequest.swift
//  the-movie-ios
//
//  Created by Junior Braga on 09/05/21.
//

import Foundation
import Alamofire

class ServiceRequest{
    static func fetchFilms() {
        RequestServiceUrl.shared.getFilms( handler: { (object) in
            print(object)
        })
    }
}
