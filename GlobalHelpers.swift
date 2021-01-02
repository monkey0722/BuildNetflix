//
//  GlobalHelpers.swift
//  BuildNetflix
//
//  Created by Taku Kobachi on 2021/01/02.
//

import Foundation

let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/300")!)
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travelers", thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/301")!)
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Community", thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/302")!)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Alone", thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/303")!)
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Hannibal", thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/304")!)
let exampleMovie6 = Movie(id: UUID().uuidString, name: "After Life", thumbnailURL: Foundation.URL(string: "https://picsum.photos/200/305")!)

let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]
