//
//  DataBaseController.swift
//  ProjetIF26
//
//  Created by Vincent on 09/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

import UIKit
import SQLite

class DataBaseController: NSObject {
    
    let DATABASE_NAME = "geocachedb"
    
    public let user_table = Table("user")
    public static let user_id = Expression<Int>("id")
    public static let user_email = Expression<String>("email")
    public static let user_password = Expression<String>("password")
    public static let user_name = Expression<String>("name")
    
    public let cache_table = Table("cache")
    public static let cache_id = Expression<Int>("id")
    public static let cache_lat = Expression<Double>("lat")
    public static let cache_lon = Expression<Double>("lon")
    public static let cache_type = Expression<Int>("type")
    public static let cache_difficulty = Expression<Int>("difficulty")
    public static let cache_terrain = Expression<Int>("terrain")
    public static let cache_size = Expression<Int>("size")
    public static let cache_owner = Expression<Int>("owner")
    public static let cache_hint = Expression<String>("hint")
    public static let cache_description = Expression<String>("description")
    
    var database: Connection!
    
    override init() {
        //Creation du fichier pour la base de données
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent(DATABASE_NAME).appendingPathExtension("sqlite3")
            let base = try Connection(fileUrl.path)
            self.database = base;
            try database.execute("PRAGMA foreign_keys = ON;")
        }catch {
            print (error)
        }
    }

    func createTables() {
        print("==> create Table User début")
        
        let createUserTable =
            user_table.create(ifNotExists: true){ table in
                table.column(DataBaseController.user_id, primaryKey: .autoincrement)
                table.column(DataBaseController.user_email)
                table.column(DataBaseController.user_password)
                table.column(DataBaseController.user_name)
        }
        do {
            //try self.database.run(dropTable)
            try self.database.run(createUserTable)
            print ("Table user créée")
        }
        catch {
            print(error)
        }
        print("==> create Table User fin")
        
        print("==> create Table Cache début")
        
        let createCacheTable =
            cache_table.create(ifNotExists: true){ table in
                table.column(DataBaseController.cache_id, primaryKey: .autoincrement)
                table.column(DataBaseController.cache_lat)
                table.column(DataBaseController.cache_lon)
                table.column(DataBaseController.cache_type)
                table.column(DataBaseController.cache_difficulty)
                table.column(DataBaseController.cache_terrain)
                table.column(DataBaseController.cache_size)
                table.column(DataBaseController.cache_owner)
                table.column(DataBaseController.cache_hint)
                table.column(DataBaseController.cache_description)
                table.foreignKey(DataBaseController.cache_owner, references: user_table, DataBaseController.user_id)
                
        }
        do {
            //try self.database.run(dropTable)
            try self.database.run(createCacheTable)
            print ("Table Cache créée")
        }
        catch {
            print(error)
        }
        print("==> create Table User fin")
    }
}
