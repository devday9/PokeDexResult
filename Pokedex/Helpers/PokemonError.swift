//
//  PokemonError.swift
//  Pokedex
//
//  Created by Deven Day on 9/22/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

enum PokemonError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case invalidData
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "unable to reach the server with the given URL."
        case .thrownError(let error):
            return "We found an error: \(error) - \(error.localizedDescription) "
        case .invalidData:
            return "data was not found, or was invalid."
        }
    }
}
