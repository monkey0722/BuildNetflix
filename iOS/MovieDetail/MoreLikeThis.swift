//
//  MoreLikeThis.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/11.
//

import SwiftUI

struct MoreLikeThis: View {
  var movies: [Movie]
  
  let coulumns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
  ]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: coulumns) {
        ForEach(0..<movies.count) { index in
          StandardHomeMovie(movie: movies[index])
        }
      }
    }
  }
}

struct MoreLikeThis_Previews: PreviewProvider {
  static var previews: some View {
    MoreLikeThis(movies: exampleMovies)
  }
}
