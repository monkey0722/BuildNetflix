//
//  Trailer.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/11.
//

import Foundation

struct Trailer: Identifiable, Hashable {
  var id: String = UUID().uuidString
  var name: String
  var videoURL: URL
  var thumbnailImageURL: URL
}
