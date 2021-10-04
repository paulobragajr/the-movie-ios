//
//  MovieSeries.swift
//  the-movie-ios
//
//  Created by Junior Braga on 03/10/21.
//

import Foundation
import SwiftyJSON

class MovieSeries:Codable, Identifiable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    fileprivate struct SerializationKeys {
        static let adult = "adult"
        static let video = "video"
        static let backdrop_path = "backdrop_path"
        static let original_language = "original_language"
        static let original_title = "original_title"
        static let release_date = "release_date"
        static let overview = "overview"
        static let genres = "genres"
        static let poster_path = "poster_path"
        static let title = "title"
        static let tagline = "tagline"
        static let genre_ids = "genre_ids"
        static let popularity = "popularity"
        static let vote_average = "vote_average"
        static let vote_count = "vote_count"
        static let id = "id"
    }
    
    // MARK: Properties
    public var adult: Bool?
    public var video: Bool?
    public var backdrop_path: String?
    public var original_language: String?
    public var original_title: String?
    public var release_date: String?
    public var overview: String?
    public var genres: String?
    public var poster_path: String?
    public var title: String?
    public var tagline:String?
    public var genre_ids: [Int]?
    public var popularity: Double?
    public var vote_average: Double?
    public var vote_count: Int?
    public var id: Int?
    
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
        adult = json[SerializationKeys.adult].bool ?? false
        video = json[SerializationKeys.video].bool ?? false
        backdrop_path = json[SerializationKeys.backdrop_path].string ?? ""
        original_language = json[SerializationKeys.original_language].string ?? ""
        original_title = json[SerializationKeys.original_title].string ?? ""
        release_date = json[SerializationKeys.release_date].string ?? ""
        overview = json[SerializationKeys.overview].string ?? ""
        genres = json[SerializationKeys.genres].string ?? ""
        poster_path = json[SerializationKeys.poster_path].string ?? ""
        title = json[SerializationKeys.title].string ?? ""
        tagline = json[SerializationKeys.tagline].string ?? ""
//        genre_ids = json[SerializationKeys.genre_ids] ?? [0]
        popularity = json[SerializationKeys.popularity].double ?? 0
        vote_average = json[SerializationKeys.vote_average].double ?? 0
        vote_count = json[SerializationKeys.vote_count].int ?? 0
        id = json[SerializationKeys.id].int ?? 0
    }
}
