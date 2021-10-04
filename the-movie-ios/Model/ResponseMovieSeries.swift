//
//  ResponseMovieSeries.swift
//  the-movie-ios
//
//  Created by Junior Braga on 02/10/21.
//

import Foundation
import SwiftyJSON

class ResponseMovieSeries: NSObject {
    
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    fileprivate struct SerializationKeys {
        static let page = "page"
        static let totalResults = "total_results"
        static let totalPages = "total_pages"
        static let results = "results"
    }
    
    // MARK: Properties
    public var page: Int
    public var totalResults: Int
    public var totalPages: Int
    var results:[MovieSeries]?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        page = json[SerializationKeys.page].int ?? 0
        totalResults = json[SerializationKeys.totalResults].int ?? 0
        totalPages = json[SerializationKeys.totalPages].int ?? 0
        if let items = json[SerializationKeys.results].array { results = items.map { MovieSeries(json: $0) } }
    }
}
