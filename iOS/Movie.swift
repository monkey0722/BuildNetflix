//
//  Movie.swift
//  BuildNetflix
//
//  Created by Taku Kobachi on 2021/01/02.
//

import Foundation

struct Movie: Identifiable {
  var id: String
  var name: String
  var thumbnailURL: URL
  var categories: [String]
  // MovieDetail View
  var yaer: Int
  var rating: String
  var numberOfSeasons: Int?
  var episodes: [Episode]?
  var promotionHeadline: String?
  var numberOfSeasonsDisplay: String {
    if let num = numberOfSeasons {
      if num == 1 {
        return "1 season"
      } else {
        return "\(num) seasons"
      }
    }
    return ""
  }
}
