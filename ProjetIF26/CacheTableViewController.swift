//
//  CacheTableViewController.swift
//  ProjetIF26
//
//  Created by oui on 12/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

import UIKit




class CacheTableViewController: UITableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 1:
                return "Propriétaire"
            case 2:
                return "Difficulté"
            case 3:
                return "Terrain"
            case 4:
                return "Type"
            case 5:
                return "Taille"
            case 6:
                return "Indice"
            case 7:
                return "Description"
            default:
                return "default"
        }
        
            
       
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        return cell
    }
}
