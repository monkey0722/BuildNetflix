//
//  PreviewList.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/02/07.
//

import SwiftUI

struct PreviewList: View {
  var movies: [Movie]
  let screen = UIScreen.main.bounds
  let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
  
  @Binding var currentSelection: Int
  @Binding var isVisible: Bool
  @State private var currentTranslation: CGFloat = 0
  
  func shouldPlayVideo(index: Int) -> Bool {
    if !isVisible {
      return false
    }
    if index != currentSelection {
      return false
    }
    return true
  }
  
  var body: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(.all)
      PagerView(
        pageCount: movies.count,
        currentIndex: $currentSelection,
        translation: $currentTranslation,
        externalDragGesture: externalDragGesture
      ) {
        ForEach(0..<movies.count) { movieIndex in
          let movie = movies[movieIndex]
          PreviewView(
            vm: PreviewVM(movie: movie),
            playVideo: shouldPlayVideo(index: movieIndex)
          ).frame(width: screen.width)
        }
      }.frame(width: screen.width)
    }
  }
}

//struct ExamplePreviewList: View {
//  @State private var currentSelection = 0
//  @State private var isVisible = true
//
//  var body: some View {
//    PreviewList(
//      movies: exampleMovies,
//      currentSelection: $currentSelection,
//      isVisible: $isVisible,
//      externalDragGesture: externalDragGesture
//    )
//  }
//}
//
//
//struct PreviewList_Previews: PreviewProvider {
//  static var previews: some View {
//    ExamplePreviewList()
//  }
//}
