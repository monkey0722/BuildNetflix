//
//  HomeView.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/02.
//

import SwiftUI

struct HomeView: View {
  var vm = HomeVM()
  var body: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      // main vstack
      ScrollView(showsIndicators: false) {
        LazyVStack {
          ForEach(vm.allCategories, id: \.self) { category in
            VStack {
              HStack {
                Text(category).font(.title3).bold()
                Spacer()
              }
              ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                  ForEach(vm.getMovie(forCat: category)) { movie in
                    StandardHomeMovie(movie: movie)
                      .frame(width: 100, height: 200)
                      .padding(.horizontal, 20)
                  }
                }
              }
            }
          }
        }
      }
    }.foregroundColor(.white)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
