//
//  NotificationBar.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/29.
//

import SwiftUI

struct NotificationBar: View {
  @Binding var showNotification: Bool
  var body: some View {
    Button(action: {
      showNotification = true
    }, label: {
      HStack {
        Image(systemName: "bell")
        Text("Notification").bold()
        Spacer()
        Image(systemName: "chevron.right")
      }
    })
    .foregroundColor(.white)
    .padding()
  }
}

struct NotificationBar_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      NotificationBar(showNotification: .constant(false))
    }
  }
}
