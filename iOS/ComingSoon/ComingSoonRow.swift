//
//  ComingSoonRow.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/29.
//

import SwiftUI
import KingfisherSwiftUI
import AVKit

struct ComingSoonRow: View {
  var movie: Movie
  @Binding var movieDetailToShow: Movie?

  let screen = UIScreen.main.bounds

  var player: AVPlayer {
    AVPlayer(url: URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!)
  }

  var body: some View {
    VStack {
      Color.blue.frame(height: 200)
      // VideoPlayer(player: player).frame(height: 200)
      
      VStack {
        HStack {
          KFImage(movie.thumbnailURL)
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: screen.size.width / 3, height: 75)
            .clipped()

          Spacer()

          Button(action: {
            // remind me
          }, label: {
            VStack {
              Image(systemName: "bell").font(.title3)
              Text("Remind Me")
            }
          }).padding(.horizontal)

          Button(action: {
            movieDetailToShow = movie
          }, label: {
            VStack {
              Image(systemName: "info.circle").font(.title3)
              Text("Info")
            }
          }).padding(.trailing, 24)
        }
      }.font(.caption)

      VStack(alignment: .leading) {
        Text(movie.name).font(.title2).bold()
        Text(movie.episodeDescriptionDisplay)
          .foregroundColor(.gray)
          .font(.subheadline)
      }

    }
    .foregroundColor(.white)
    .padding()
  }
}

struct ComingSoonRow_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      ComingSoonRow(movie: exampleMovie1, movieDetailToShow: .constant(nil))
    }
  }
}
