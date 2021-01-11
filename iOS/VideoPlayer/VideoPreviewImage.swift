//
//  VideoPreviewImage.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/01/11.
//

import SwiftUI
import KingfisherSwiftUI

struct VideoPreviewImage: View {
  var imageURL: URL
  var videoURL: URL
  
  @State private var showImgVideoPlayer = false
  
  var body: some View {
    ZStack {
      KFImage(imageURL).resizable()
      Button(action: {
        showImgVideoPlayer = true
      }, label: {
        Image(systemName: "play.circle")
          .foregroundColor(.white)
          .font(.system(size: 40))
      })
      sheet(isPresented: $showImgVideoPlayer, content: {
        SwiftUIVideoView(url: videoURL)
      })
    }
  }
}

struct VideoPreviewImage_Previews: PreviewProvider {
  static var previews: some View {
    VideoPreviewImage(imageURL: exampleImageURL1, videoURL: exampleVideoURL)
  }
}
