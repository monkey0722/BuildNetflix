//
//  SearchView.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/23.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject var vm = SearchVM()
  @State private var searchText = ""
  
  var body: some View {
    let searchTextBinding = Binding {
      return searchText
    } set: {
      searchText = $0
      vm.updateSearchText(with: $0)
    }
    
    return ZStack {
      Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      VStack {
        SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
          .padding()
        
        ScrollView {
          if vm.isShowingPopularMovies {
            Text("Popular Movies")
          }
          
          if vm.viewState == .empty {
            Text("Empty")
          } else if vm.viewState == .ready && !vm.isShowingPopularMovies {
            Text("Search Results")
          }
        }
        
        Spacer()
      }
    }.foregroundColor(.white)
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
