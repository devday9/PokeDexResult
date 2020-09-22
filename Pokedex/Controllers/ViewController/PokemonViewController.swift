//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Deven Day on 9/22/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeIDLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchBar.delegate = self
    }
    
    func fetchSpriteAndUpdateUI(for pokemon: Pokemon) {
        PokemonController.fetchSprite(for: pokemon) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.pokeImageView.image = image
                    self.pokeNameLabel.text = pokemon.name.uppercased()
                    self.pokeIDLabel.text = "ID: \(pokemon.id)"
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}//END OF CLASS

extension PokemonViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
     
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
                
        PokemonController.fetchPokemon(searchTerm: searchTerm) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemon):
                    self.fetchSpriteAndUpdateUI(for: pokemon)
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}
