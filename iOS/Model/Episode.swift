//
//  Episode.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/11.
//

import Foundation

struct Episode: Identifiable {
  var id = UUID().uuidString
  var name: String
  var season: Int
  var thumbnailImageURLString: String
  var length: Int
  var thumbnailURL: URL {
    return URL(string: thumbnailImageURLString)!
  }
}
