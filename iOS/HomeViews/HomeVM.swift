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
  
  public var allGenre: [HomeGenre] = [.AllGenres, .Action, .Comedy, .Horror, .Thriller]

  public func getMovie(forCat cat: String, andHomeRow homeRow : HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
    switch homeRow {
    case .home:
      return movies[cat] ?? []
    case .movies:
      return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
    case .tvShows:
      return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
    case .myList:
      // TODO: Setup MyList Properly
      return movies[cat] ?? []
    }
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
