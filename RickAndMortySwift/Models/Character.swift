//
//  Character.swift
//  RickAndMortySwift
//
//  Created by Manan on 2021-05-07.
//

import Foundation

struct PagedCharacter: Codable {
    let info: Info
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String?
    let species: String?
    let gender: String?
    //let origin: Location
    //let location: Location
    //let episode: [Episode]
    let imageURL: String?
    let url: String?
}
