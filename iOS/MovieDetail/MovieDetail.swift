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
  
  @State private var showSeasonPicker = false
  @State private var selectedSeason = 1
  
  @Binding var movieDetailToShow: Movie?
  
  var body: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      ZStack {
        VStack {
          HStack {
            Spacer()
            Button(action : {
              movieDetailToShow = nil
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
              
              CustomTabSwitcher(
                tabs: [.episodes, .trailers, .more],
                movie: movie,
                showSeasonPicker: $showSeasonPicker,
                selectedSeason: $selectedSeason
              )
            }.padding(.horizontal, 10)
          }
        }.foregroundColor(.white)
        
        if(showSeasonPicker) {
          Group {
            Color.black.opacity(0.9)
            VStack(spacing: 20) {
              Spacer()
              ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                Button(action: {
                  self.selectedSeason = season + 1
                  self.showSeasonPicker = false
                }, label: {
                  Text("Season \(season)")
                    .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                    .font(selectedSeason == season + 1 ? .title : .title2)
                    .bold()
                })
              }
              
              Spacer()
              Button(action: {
                self.showSeasonPicker = false
              }, label: {
                Image(systemName: "x.circle.fill")
                  .foregroundColor(.white)
                  .font(.system(size: 40))
                  .scaleEffect(x: 1.1)
              }).padding(.bottom, 30)
            }
          }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
      }
    }
  }
}

struct MovieDetail_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetail(movie: exampleMovie3, movieDetailToShow: .constant(nil))
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
