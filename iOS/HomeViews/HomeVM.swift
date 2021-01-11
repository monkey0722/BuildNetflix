//
//  HomeVM.swift
//  BuildNetflix
//
//  Created by Taku Kobachi on 2021/01/02.
//

import Foundation

class HomeVM: ObservableObject {
  // String === Category
  @Published var movies: [String: [Movie]] = [:]

  public var allCategories: [String] {
    movies.keys.map({ String($0) })
  }

  public func getMovie(forCat cat: String) -> [Movie] {
    return movies[cat] ?? []
  }

  init() {
    setupMovies()
  }

  func setupMovies() {
    movies["Trending Now"] = exampleMovies
    movies["Stand-up Comedy"] = exampleMovies.shuffled()
    movies["New Releases"] = exampleMovies.shuffled()
    movies["Watch It Agein"] = exampleMovies.shuffled()
    movies["Sociality"] = exampleMovies.shuffled()
  }
}
