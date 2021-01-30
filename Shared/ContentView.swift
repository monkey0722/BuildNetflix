//
//  ContentView.swift
//  Shared
//
//  Created by Taku Kobachi on 2021/01/02.
//

import SwiftUI

struct ContentView: View {
  init() {
    UITabBar.appearance().isTranslucent = false
    UITabBar.appearance().barTintColor = UIColor.black
  }

  var body: some View {
    TabView {
      HomeView()
        .tabItem {
          Image(systemName: "house")
          Text("Home")
        }.tag(0)
      
      SearchView()
        .tabItem {
          Image(systemName: "magnifyingglass")
          Text("Search")
        }.tag(1)
      
      ComingSoon()
        .tabItem {
          Image(systemName: "play.rectangle")
          Text("Coming Sonn")
        }.tag(2)
      
      Text("DownLoads")
        .tabItem {
          Image(systemName: "arrow.down.to.line.alt")
          Text("3")
        }.tag(3)
      
      Text("More")
        .tabItem {
          Image(systemName: "equal")
          Text("4")
        }.tag(4)
    }.accentColor(.white)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
