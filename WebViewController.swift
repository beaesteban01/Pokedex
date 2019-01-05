//
//  WebViewController.swift
//  pokedex
//
//  Created by Beatriz Esteban on 04/11/2018.
//  Copyright © 2018 Beatriz Esteban. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    
    /// Race a mostrar, o nil para mostrar la pagina Home
   
    
    @IBOutlet weak var webView: WKWebView!
    
    var nameBicho: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // URL a mostrar

        var str = "http://es.pokemon.wikia.com"

        if nameBicho != nil {
            // Poner nombre de la raza como titulo de la Navigation Bar
            title = nameBicho!

            // Añadir la raza al URL escapando caracteres conflictivos
            if let path = "wiki/\(nameBicho!)".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
                str = "\(str)/\(path)"
            }
        } else {
            // Poner Pokedex como titulo de la Navigation Bar
            title = "Pokedex"
        }

        if let url = URL(string: str) {
            let req = URLRequest(url: url)
            webView.load(req)

            print(str)
            
    
        }
    
    }
    

}
