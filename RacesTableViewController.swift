//
//  RacesTableViewController.swift
//  pokedex
//
//  Created by Beatriz Esteban on 04/11/2018.
//  Copyright © 2018 Beatriz Esteban. All rights reserved.
//

import UIKit

class RacesTableViewController: UITableViewController {

    var model = PokedexModel()
    var type: Type? //valor que pasa de la pantalla anterior
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = type?.name ?? "NONO"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return type?.races.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Race Cell", for: indexPath)

        // Configure the cell...
        
        let raza = type!.races[indexPath.row] //existe a la fuerza, nucna va  ser nil pq si voy ahi es pq esta
        cell.textLabel?.text = raza.name
        cell.detailTextLabel?.text = "\(raza.code)"
        cell.imageView?.image = UIImage(named: raza.icon)
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Web" {
            
            let sw = segue.destination as! WebViewController
            
            
            //Saber que celda he tocado: intneta sacar lo que hay y si l hay lo metes ahi, si no no pasa nda
            if let indexPath = tableView.indexPathForSelectedRow {
                
                //me tiene que dar el nombre del bicho de la raza para meterlo en la url
                sw.nameBicho = type?.races[indexPath.row].name
            }
        }
    }
    

}
