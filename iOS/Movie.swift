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
}
