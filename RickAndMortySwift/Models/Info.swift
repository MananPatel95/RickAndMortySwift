//
//  Info.swift
//  RickAndMortySwift
//
//  Created by Manan on 2021-05-07.
//

import Foundation

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
