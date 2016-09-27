//
//  PokemonDetailVCViewController.swift
//  pokedex3
//
//  Created by Ben Wong on 2016-09-27.
//  Copyright © 2016 Ben Wong. All rights reserved.
//

import UIKit

class PokemonDetailVCViewController: UIViewController {
    
    
    var pokemon: Pokemon!
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!

    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let img = UIImage(named: "\(pokemon.pokeDexId)")
        
        mainImg.image = img
        currentEvoImg.image = img
        pokedexLbl.text = "\(pokemon.pokeDexId)"
        
        
        nameLbl.text = pokemon.name.capitalized
        
        pokemon.downloadPokemonDetail {
            //Whatever we write will only be called after the network call is complete
            print("Did arrive here?")
            self.updateUI()
        }
    }
    
    
    func updateUI(){
        pokedexLbl.text = String(pokemon.pokeDexId)
        typeLbl.text = pokemon.typr
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.typr
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
        
    }
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
