//
//  StandardHomeMovie.swift
//  BuildNetflix
//
//  Created by Taku Kobachi on 2021/01/02.
//

import SwiftUI
import KingfisherSwiftUI

struct StandardHomeMovie: View {
  var movie: Movie
  var body: some View {
    KFImage(movie.thumbnailURL)
      .resizable()
      .scaledToFill()
  }
}

struct StandardHomeMovie_Previews: PreviewProvider {
  static var previews: some View {
    StandardHomeMovie(movie: exampleMovie3)
  }
}
