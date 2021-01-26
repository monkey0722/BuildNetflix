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
    GeometryReader { proxy in
      KFImage(movie.thumbnailURL)
        .resizable()
        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        .frame(width: proxy.size.width, height: proxy.size.height)
        .clipped()
    }
  }
}

struct StandardHomeMovie_Previews: PreviewProvider {
  static var previews: some View {
    StandardHomeMovie(movie: exampleMovie1)
  }
}
