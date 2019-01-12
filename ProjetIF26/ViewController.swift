//
//  ViewController.swift
//  ProjetIF26
//
//  Created by GUILLOUX Valentin on 30/11/2018.
//  Copyright © 2018 GUILLOUX Valentin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        cacheDAO.insert(cache: cache1)
        cacheDAO.insert(cache: cache2)
        
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

