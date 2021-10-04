//
//  ServiceRequest.swift
//  the-movie-ios
//
//  Created by Junior Braga on 09/05/21.
//

import Foundation
import Alamofire

protocol ServiceRequestDelegate {
    func fetchFilmsSuccess(responseMovieSeries: ResponseMovieSeries)
}
typealias handlerResponseMovieSeries = (ResponseMovieSeries?) -> Swift.Void

class ServiceRequest{
    static let shared = ServiceRequest()
    var delegate: ServiceRequestDelegate?
    
    func fetchFilms(page: Int,dataResponseJSON: @escaping handlerResponseMovieSeries) {
        RequestServiceUrl.shared.getFilms( page: page, handler: { (object) in
            let response = ResponseMovieSeries(object: object)
            dataResponseJSON(response)
        })
    }
}
