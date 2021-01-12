//
//  EpisodeView.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/12.
//

import SwiftUI

struct EpisodeView: View {
  var episodes: [Episode]
  
  @Binding var showSeasonPicker: Bool
  @Binding var selectedSeason: Int
  
  func getEpisodes(forSeason season: Int) -> [Episode] {
    return episodes.filter({ $0.season == season })
  }
  
  var body: some View {
    VStack {
      // Season Picker
      HStack {
        Button(action: {
          showSeasonPicker = true
        }, label: {
          Group {
            Text("Season 1")
            Image(systemName: "chevron.down")
          }.font(.system(size: 16))
        })
        Spacer()
      }
      // Episodes list
      ForEach(getEpisodes(forSeason: selectedSeason)) { episodes in
        Text("TEST")
      }
      Spacer()
    }.foregroundColor(.white)
  }
}

struct EpisodeView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      EpisodeView(episodes: allExampleEpisodes, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
    }
  }
}
