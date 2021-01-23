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
    ZStack {
      Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      VStack {
        SearchBar(text: $searchText, isLoading: $vm.isLoading)
          .padding()
        Spacer()
      }
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
