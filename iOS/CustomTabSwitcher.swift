//
//  CustomTabSwitcher.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/09.
//

import SwiftUI

enum CustomTab: String {
  case episodes = "EPISODES"
  case trailers = "TRAILERS & MORE"
  case more = "MORE LINK THIS"
}

struct CustomTabSwitcher: View {
  @State private var currentTab: CustomTab = .episodes
  
  var tabs: [CustomTab]
  var movie: Movie
  
  func widthForTab(_ tab: CustomTab) -> CGFloat {
    let string = tab.rawValue
    return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
  }
  
  var body: some View {
    VStack {
      // Custom tab picker
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(tabs, id: \.self) { tab in
            VStack {
              // Red Bar
              Rectangle()
                .frame(width: widthForTab(tab), height: 6)
                .foregroundColor(tab == currentTab ? Color.red : Color.black)
              // Button
              Button(action: {
                currentTab = tab
              }, label: {
                Text(tab.rawValue)
                  .font(.system(size: 16, weight: .bold))
                  .foregroundColor(tab == currentTab ? Color.white : Color.gray)
              })
              .buttonStyle(PlainButtonStyle())
              .frame(width: widthForTab(tab), height: 30)
            }
          }
        }
      }
      // Selected View
      switch currentTab {
        case .episodes:
          Text("EPISODES")
        case .trailers:
          TrailerList(trailers: movie.trailers)
        case .more:
          MoreLikeThis(movies: movie.moreLikeThisMovies)
      }
    }.foregroundColor(.white)
  }
}

struct CustomTabSwitcher_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: exampleMovie3)
    }
  }
}
