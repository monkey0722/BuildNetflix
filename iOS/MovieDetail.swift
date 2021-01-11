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
            
            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
              //
            }

            CurrentEpisodeInformation(movie: movie)
            CastInfo(movie: movie)
            
            HStack(spacing: 60) {
              SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                //
              }
              SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: true) {
                //
              }
              SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                //
              }
              Spacer()
            }.padding(.leading, 20)
            
            // CustomTabSwitcher()
            
          }.padding(.horizontal, 10)
        }
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

struct CurrentEpisodeInformation: View {
  var movie: Movie
  var body: some View {
    Group {
      HStack {
        Text(movie.episodeInfoDisplay).bold()
        Spacer()
      }.padding(.vertical, 4)
      HStack {
        Text(movie.episodeDescriptionDisplay)
          .font(.subheadline)
        Spacer()
      }
    }
  }
}

struct CastInfo: View {
  var movie: Movie
  var body: some View {
    VStack {
      HStack {
        Text("Cast: \(movie.cast)")
        Spacer()
      }
      HStack {
        Text("Creators: \(movie.creators)")
        Spacer()
      }
    }
    .font(.caption)
    .foregroundColor(.gray)
    .padding(.vertical, 10)
  }
}
