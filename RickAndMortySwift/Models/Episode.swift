//
//  Episode.swift
//  RickAndMortySwift
//
//  Created by Manan on 2021-05-07.
//

import Foundation

struct PagedEpisode: Codable {
    let info: Info
    let results: [Episode]
}

struct Episode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    //let characters: [Character]
    let url: String
    
}
