//
//  PagerView.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/02/03.
//

import SwiftUI

struct PagerView<Content: View>: View {
  let pageCount: Int
  let content: Content
  let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>

  @State private var verticalDragIsActive = false

  @Binding var currentIndex: Int
  @Binding var translation: CGFloat
  
  init(
    pageCount: Int,
    currentIndex: Binding<Int>,
    translation: Binding<CGFloat>,
    externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>,
    @ViewBuilder content: () -> Content
  ) {
    self.pageCount = pageCount
    self._currentIndex = currentIndex
    self._translation = translation
    self.externalDragGesture = externalDragGesture
    self.content = content()
  }
  
  var body: some View {
    GeometryReader { geo in
      HStack(spacing: 0) {
        self.content.frame(width: geo.size.width)
      }
      .frame(width: geo.size.width, alignment: .leading)
      .offset(x: -CGFloat(self.currentIndex) * geo.size.width)
      .offset(x: self.translation)
      .animation(.interactiveSpring())
      .gesture(
        externalDragGesture.simultaneously(
          with:
            DragGesture()
            .onChanged({ value in
              if verticalDragIsActive {
                return
              }
              if abs(value.translation.width) < abs(value.translation.height) {
                verticalDragIsActive = true
                return
              }
              // Horizontal Drag Only
              translation = value.translation.width
            })
            .onEnded({ value in
              if verticalDragIsActive {
                verticalDragIsActive = false
                return
              }
              // Ending a horizontal drag
              let offset = value.translation.width / geo.size.width
              let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
              currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
              translation = 0
            })
        )
      )
    }
  }
}

//struct PagerDummy: View {
//  @State private var currentIndex: Int = 0
//  @State private var translation: CGFloat = .zero
//  
//  var body: some View {
//    PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
//      Color.red
//      Color.blue
//      Color.black
//    }
//  }
//}
//
//struct PagerView_Previews: PreviewProvider {
//  static var previews: some View {
//    PagerDummy()
//  }
//}
