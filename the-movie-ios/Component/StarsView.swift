//
//  StarsView.swift
//  the-movie-ios
//
//  Created by Junior Braga on 04/10/21.
//

import Foundation
import SwiftUI

struct StarsView: View {
  private static let MAX_RATING: Float = 5 // Defines upper limit of the rating
  private static let COLOR = Color(hex: "#FF03DAC5") // The color of the stars

  let rating: Float
  private let fullCount: Int
  private let emptyCount: Int
  private let halfFullCount: Int

  init(rating: Float) {
    let ratingParams = rating / 2
    self.rating = ratingParams
    fullCount = Int(ratingParams)
    emptyCount = Int(StarsView.MAX_RATING - ratingParams)
    halfFullCount = (Float(fullCount + emptyCount) < StarsView.MAX_RATING) ? 1 : 0
  }

  var body: some View {
    HStack {
      ForEach(0..<fullCount) { _ in
         self.fullStar
       }
       ForEach(0..<halfFullCount) { _ in
         self.halfFullStar
       }
       ForEach(0..<emptyCount) { _ in
         self.emptyStar
       }
    }
  }

  private var fullStar: some View {
    Image(systemName: "star.fill").foregroundColor(StarsView.COLOR)
  }

  private var halfFullStar: some View {
    Image(systemName: "star.lefthalf.fill").foregroundColor(StarsView.COLOR)
  }

  private var emptyStar: some View {
    Image(systemName: "star").foregroundColor(StarsView.COLOR)
  }
}
