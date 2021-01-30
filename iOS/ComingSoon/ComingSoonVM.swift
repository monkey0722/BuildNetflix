//
//  ComingSoonVM.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/30.
//

import Foundation

class ComingSoonVM: ObservableObject {
  @Published var movies: [Movie] = []
  
  init () {
    self.movies = generateMovies(20)
  }
}
