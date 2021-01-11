//
//  GlobalHelpers.swift
//  BuildNetflix
//
//  Created by Taku Kobachi on 2021/01/02.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!

let exampleImageURL1 = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomExampleImageURL: URL {
  return [exampleImageURL1, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL1
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)

let exampleTrailer2 = Trailer(name: "The Hero's Journey", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)

let exampleTrailer3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

let exampleMovie1 = Movie(
  id: UUID().uuidString,
  name: "DARK",
  thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/300")!,
  categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
  yaer: 2021,
  rating: "TV-MA",
  numberOfSeasons: 1,
  defaultEpisodeInfo: exampleEpisodeInfo1,
  creators: "Baran bo Odan, Jantje Friese",
  cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
  moreLikeThisMovies: [],
  trailers: exampleTrailers
)
let exampleMovie2 = Movie(
  id: UUID().uuidString,
  name: "Travelers",
  thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/301")!,
  categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
  yaer: 2021,
  rating: "TV-MA",
  numberOfSeasons: 2,
  defaultEpisodeInfo: exampleEpisodeInfo1,
  creators: "Baran bo Odan, Jantje Friese",
  cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
  moreLikeThisMovies: [],
  trailers: exampleTrailers
)
let exampleMovie3 = Movie(
  id: UUID().uuidString,
  name: "Community",
  thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/302")!,
  categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
  yaer: 2021,
  rating: "TV-MA",
  numberOfSeasons: 3,
  defaultEpisodeInfo: exampleEpisodeInfo1,
  creators: "Baran bo Odan, Jantje Friese",
  cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
  moreLikeThisMovies: [exampleMovie1, exampleMovie2, exampleMovie4, exampleMovie5, exampleMovie6],
  trailers: exampleTrailers
  // promotionHeadline: "New episode coming soon"
)
let exampleMovie4 = Movie(
  id: UUID().uuidString,
  name: "Alone",
  thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/303")!,
  categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
  yaer: 2021,
  rating: "TV-MA",
  numberOfSeasons: 4,
  defaultEpisodeInfo: exampleEpisodeInfo1,
  creators: "Baran bo Odan, Jantje Friese",
  cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
  moreLikeThisMovies: [],
  trailers: exampleTrailers
)
let exampleMovie5 = Movie(
  id: UUID().uuidString,
  name: "Hannibal",
  thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/304")!,
  categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
  yaer: 2021,
  rating: "TV-MA",
  numberOfSeasons: 5,
  defaultEpisodeInfo: exampleEpisodeInfo1,
  creators: "Baran bo Odan, Jantje Friese",
  cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
  moreLikeThisMovies: [exampleMovie1, exampleMovie2, exampleMovie4, exampleMovie6],
  trailers: exampleTrailers
)
let exampleMovie6 = Movie(
  id: UUID().uuidString,
  name: "After Life",
  thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/305")!,
  categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
  yaer: 2021,
  rating: "TV-MA",
  numberOfSeasons: 6,
  defaultEpisodeInfo: exampleEpisodeInfo1,
  creators: "Baran bo Odan, Jantje Friese",
  cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
  moreLikeThisMovies: [],
  trailers: exampleTrailers
)

let exampleEpisodeInfo1 = CurrentEpisodeIngo(
  episodeName: "Alice in the Land of the Rising Sun",
  description: "Ryohei Arisu hides in a public restroom with two of his friends to avoid detection by the police. However, when they get out, they find the empty streets of Tokyo.",
  season: 2,
  episode: 1
)

var exampleMovies: [Movie] {
  return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6].shuffled()
}

extension LinearGradient {
  static let blackOpacityGradient = LinearGradient(
    gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
    startPoint: .top,
    endPoint: .bottom
  )
}


extension String {
  func widthOfString(usingFont font: UIFont) -> CGFloat {
    let fontAttributes = [NSAttributedString.Key.font: font]
    let size = self.size(withAttributes: fontAttributes)
    return size.width
  }
}
