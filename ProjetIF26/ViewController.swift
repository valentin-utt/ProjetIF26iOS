//
//  ViewController.swift
//  ProjetIF26
//
//  Created by GUILLOUX Valentin on 30/11/2018.
//  Copyright © 2018 GUILLOUX Valentin. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    var database: Connection!
    
    let user_table = Table("user")
    let user_id = Expression<Int>("id")
    let user_email = Expression<String>("email")
    let user_password = Expression<String>("password")
    let user_name = Expression<String>("name")
    
    let cache_table = Table("cache")
    let cache_id = Expression<Int>("id")
    let cache_lat = Expression<Double>("lat")
    let cache_lon = Expression<Double>("lon")
    let cache_type = Expression<Int>("type")
    let cache_difficulty = Expression<Int>("difficulty")
    let cache_terrain = Expression<Int>("terrain")
    let cache_size = Expression<Int>("size")
    let cache_owner = Expression<Int>("owner")
    let cache_hint = Expression<String>("hint")
    let cache_description = Expression<String>("description")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creation du fichier users.sqlite3
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let base = try Connection(fileUrl.path)
            self.database = base;
        }catch {
            print (error)
        }
        
        //Creation du fichier caches.sqlite3
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("caches").appendingPathExtension("sqlite3")
            let base = try Connection(fileUrl.path)
            self.database = base;
        }catch {
            print (error)
        }
        
        createTableUser()
        createTableCache()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTableUser() {
        print("==> create Table User début")
        
        let createTable =
            self.user_table.create { table in
                table.column(self.user_id, primaryKey: true)
                table.column(self.user_email)
                table.column(self.user_password)
                table.column(self.user_name)
        }
        do {
            //try self.database.run(dropTable)
            try self.database.run(createTable)
            print ("Table user créée")
        }
        catch {
            print(error)
        }
        print("==> create Table User fin")
    }

    func createTableCache() {
        print("==> create Table Cache début")
        
        let createTable =
            self.cache_table.create { table in
                table.column(self.cache_id, primaryKey: true)
                table.column(self.cache_lat)
                table.column(self.cache_lon)
                table.column(self.cache_type)
                table.column(self.cache_difficulty)
                table.column(self.cache_terrain)
                table.column(self.cache_size)
                table.column(self.cache_owner)
                table.column(self.cache_hint)
                table.column(self.cache_description)
        }
        do {
            //try self.database.run(dropTable)
            try self.database.run(createTable)
            print ("Table Cache créée")
        }
        catch {
            print(error)
        }
        print("==> create Table User fin")
    }

}

