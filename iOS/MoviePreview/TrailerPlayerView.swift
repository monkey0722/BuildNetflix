//
//  TrailerPlayerView.swift
//  BuildNetflix (iOS)
//
//  Created by Taku Kobachi on 2021/02/04.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
  var videoURL: URL?
  
  @Binding var playVideo: Bool
  
  var body: some View {
    if videoURL != nil {
      VideoPlayer(url: videoURL!, play: $playVideo)
    } else {
      Text("Could not load video")
    }
  }
}

struct TrailerPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    TrailerPlayerView(videoURL: nil, playVideo: .constant(true))
  }
}
