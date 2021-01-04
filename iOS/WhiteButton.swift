//
//  WhiteButton.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/04.
//

import SwiftUI

struct WhiteButton: View {
  var text: String
  var imageName: String
  var action: () -> Void
  
  var body: some View {
    Button(action: action, label: {
      HStack {
        Spacer()
        Image(systemName: imageName)
          .font(.headline)
        Text(text)
          .bold()
          .font(.system(size: 16))
        Spacer()
      }
      .padding(.vertical, 6)
      .foregroundColor(.black)
      .background(Color.white)
      .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
    })
  }
}

struct WhiteButton_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      WhiteButton(text: "Play", imageName: "play.fill") {
        //
      }
    }
  }
}
