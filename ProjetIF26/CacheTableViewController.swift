//
//  CacheTableViewController.swift
//  ProjetIF26
//
//  Created by oui on 12/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

import UIKit




class CacheTableViewController: UITableViewController {
    
    
    var annotation: CacheAnnotation?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "Propriétaire"
            case 1:
                return "Difficulté"
            case 2:
                return "Terrain"
            case 3:
                return "Type"
            case 4:
                return "Taille"
            case 5:
                return "Indice"
            case 6:
                return "Description"
            default:
                return "default"
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cacheFound" {
            let cacheDAO:CacheDAO = CacheDAO()
            cacheDAO.deleteCacheById(id: annotation!.id)
            let mapVC = segue.destination as! MapViewController
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        let cacheDAO:CacheDAO = CacheDAO()
        let viewedCache = cacheDAO.getCacheById(id: annotation!.id )
        let userDAO:UserDAO = UserDAO()
        let cacheUser=userDAO.getUserById(id: viewedCache?.getOwner() ?? -1)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = cacheUser?.getUserName()
        case 1:
            switch(viewedCache?.getDifficulty()){
                case 1:
                    cell.textLabel?.text = "Facile"
                case 2:
                    cell.textLabel?.text = "Moyen"
                case 3:
                    cell.textLabel?.text = "Difficile"
                default:
                    cell.textLabel?.text = "Default"
            }
        case 2:
            switch(viewedCache?.getType()){
                case 1:
                    cell.textLabel?.text = "Boite"
                case 2:
                    cell.textLabel?.text = "Valise"
                case 3:
                    cell.textLabel?.text = "Trésor"
                default:
                    cell.textLabel?.text = "Default"
            }
        case 3:
            switch(viewedCache?.getTerrain()){
                case 1:
                    cell.textLabel?.text = "Dur"
                case 2:
                    cell.textLabel?.text = "Terre"
                case 3:
                    cell.textLabel?.text = "Sable"
                default:
                    cell.textLabel?.text = "Default"
                }
        case 4:
            cell.textLabel?.text = "\(viewedCache?.getSize() ?? 0)"
        case 5:
            cell.textLabel?.text = "\(viewedCache?.getHint() ?? "none")"
        case 6:
            cell.textLabel?.text = "\(viewedCache?.getDescription() ?? "none")"
        default:
            cell.textLabel?.text = "default text"
        }
        
        
        
        return cell
    }
}
