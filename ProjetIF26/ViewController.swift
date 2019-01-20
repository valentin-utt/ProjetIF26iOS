//
//  ViewController.swift
//  ProjetIF26
//
//  Created by GUILLOUX Valentin on 30/11/2018.
//  Copyright © 2018 GUILLOUX Valentin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var ConnectionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isConnected = UserDefaults.standard.bool(forKey: "isConnected") ?? false
        if(isConnected){
            ConnectionButton.setTitle("Déconnection", for: .normal)
        }else{
            ConnectionButton.setTitle("Se connecter ou s'inscrire", for: .normal)
        }
        
        
        //Tests Base User
        let userDAO:UserDAO = UserDAO()
        let user:User = User(email: "testmail", password: "pass", userName: "pseudo")
        userDAO.insert(user: user)
        let user1=userDAO.getUserById(id: 1)
        print(user1!.toString())
        
        //Tests Table Cache
        let cacheDAO:CacheDAO = CacheDAO()
        let cache1: Cache = Cache(lat: 48.26881, lon: 4.066998, type: 1, difficulty: 2, terrain: 1, size: 1, owner: 1, hint: "h1", description: "d1")
        let cache2: Cache = Cache(lat: 48.268, lon: 4.06, type: 2, difficulty: 2, terrain: 2, size: 2, owner: 1, hint: "h2", description: "d2s")
        
        
        if(UserDefaults.standard.bool(forKey: "firstRun")==false){
            cacheDAO.insert(cache: cache1)
            cacheDAO.insert(cache: cache2)
            let dialogMessage = UIAlertController(title: "Consentement", message: "Par l'utilisation de cette application, vous pouvez consentir que des informations à caractère personnel et de géolocalisation peuvent être recueillies dans le cadre de la présente application, sous la responsabilité de Chasse au trésor SAS. Elles ne sont pas destinées à être utilisées à des fins commerciales. Conformément à la réglementation applicable, notamment le Règlement européen 2016/679, dit règlement général sur la protection des données (RGPD) et les dispositions nationales relatives à l\'informatique, aux fichiers et libertés, les personnes dont les données à caractère personnel sont collectées bénéficient d\'un droit d\'accès, de rectification, de suppression et d\'opposition, pour motifs légitimes, aux informations les concernant. Ces droits peuvent être exercés par l’envoi d’un email, à juridique@chasse_au_trésor.fr. Enfin, les personnes disposent du droit d’introduire une réclamation auprès de la Commission Nationale de l’Informatique et des Libertés (CNIL).", preferredStyle: .alert)
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                
            })
            let non = UIAlertAction(title: "NON", style: .default, handler: { (action) -> Void in
                
            })
            dialogMessage.addAction(ok)
            dialogMessage.addAction(non)
            self.present(dialogMessage, animated: true, completion: nil)
            
            
            UserDefaults.standard.set(true, forKey: "firstRun")
        }
        
        
        let arrayCache = cacheDAO.getAllCache()
        for cache in arrayCache {
            print(cache.toString())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

