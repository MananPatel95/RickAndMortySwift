//
//  Location.swift
//  RickAndMortySwift
//
//  Created by Manan on 2021-05-07.
//

import Foundation

struct PagedLocation: Codable {
    let info: Info
    let results: [Location]
}

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    //let residents: [Character]
    //let url: Location
}
