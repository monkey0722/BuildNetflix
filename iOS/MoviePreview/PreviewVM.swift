//
//  PreviewVM.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/02/06.
//

import Foundation

class PreviewVM: ObservableObject {
  var movie: Movie
  
  init(movie: Movie) {
    self.movie = movie
  }
}
