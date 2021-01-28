//
//  ComingSoon.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/29.
//

import SwiftUI

struct ComingSoon: View {
  @State private var showNotificationList = false
  @State private var navBarHidden = true

  var body: some View {
    // NavigationView {
      Group {
        ZStack {
          Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
          ScrollView {
            VStack {
              NotificationBar(showNotification: $showNotificationList)
              Text("For each loop of calls")
            }
          }.foregroundColor(.white)
        }
        NavigationLink(
          destination: Text("Notifications List"),
          isActive: $showNotificationList,
          label: {
            EmptyView()
          })
          .navigationTitle("")
          .navigationBarHidden(navBarHidden)
          .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification),
                     perform: { _ in self.navBarHidden = true })
          .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification),
                     perform: { _ in self.navBarHidden = false })
      }
    // }
  }
}

struct ComingSoon_Previews: PreviewProvider {
  static var previews: some View {
    ComingSoon()
  }
}
