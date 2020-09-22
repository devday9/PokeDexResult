//
//  Pokemon.swift
//  Pokedex
//
//  Created by Deven Day on 9/22/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let id: Int
    var sprites: Sprite
    
    struct Sprite: Decodable {
        let shinySpriteURL: URL
        
        enum CodingKeys: String, CodingKey {
            case shinySpriteURL = "front_shiny"
        }
    }
}


