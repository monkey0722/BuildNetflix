//
//  MovieDetail.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/07.
//

import SwiftUI

struct MovieDetail: View {
  var movie: Movie
  let screen = UIScreen.main.bounds
  var body: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      VStack {
        HStack {
          Spacer()
          Button(action : {
            // close this view
          }, label: {
            Image(systemName: "xmark.circle").font(.system(size: 28))
          }).buttonStyle(PlainButtonStyle())
        }.padding(.horizontal, 22)
        
        ScrollView(.vertical, showsIndicators: false) {
          VStack {
            StandardHomeMovie(movie: movie)
              .frame(width: screen.width / 2.5)
            MovieInfoSubHeadline(movie: movie)
            
            if movie.promotionHeadline != nil {
              Text(movie.promotionHeadline!)
                .bold().font(.headline)
            }
          }
        }
        Spacer()
      }.foregroundColor(.white)
    }
  }
}

struct MovieDetail_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetail(movie: exampleMovie3)
  }
}

struct MovieInfoSubHeadline: View {
  var movie: Movie
  var body: some View {
    HStack(spacing: 20) {
      Image(systemName: "hand.thumbsup.fill")
      Text(String(movie.yaer))
      RatingView(rating: movie.rating)
      Text(movie.numberOfSeasonsDisplay)
    }
    .foregroundColor(.gray)
    .padding(.vertical, 6)
  }
}

struct RatingView: View {
  var rating: String
  var body: some View {
    ZStack {
      Rectangle().foregroundColor(.gray)
      Text(rating)
        .foregroundColor(.white).font(.system(size: 12)).bold()
    }.frame(width: 50, height: 20)
  }
}
