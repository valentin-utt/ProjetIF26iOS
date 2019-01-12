//
//  CacheDAO.swift
//  ProjetIF26
//
//  Created by Vincent on 09/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

import UIKit
import SQLite

class CacheDAO: DataBaseController {
    
    override init() {
        super.init()
        super.createTables()
    }
    
    func insert(cache: Cache) {
        do {
            try  super.database.run(super.cache_table.insert(DataBaseController.cache_lat <- cache.getLat(), DataBaseController.cache_lon <- cache.getLon(), DataBaseController.cache_type <- cache.getType(), DataBaseController.cache_difficulty <- cache.getDifficulty(), DataBaseController.cache_terrain <- cache.getTerrain(), DataBaseController.cache_size <- cache.getSize(), DataBaseController.cache_owner <- cache.getOwner(), DataBaseController.cache_hint <- cache.getHint(), DataBaseController.cache_description <- cache.getDescription()))
        } catch {
            print("insert cache failed : \(error)")
        }
    }
    
    func getCache(query: Table) -> Cache? {
        var cache: Cache
        do {
            for row in try super.database.prepare(query) {
                cache = Cache.init(id: row[DataBaseController.cache_id], lat: row[DataBaseController.cache_lat], lon: row[DataBaseController.cache_lon], type: row[DataBaseController.cache_type], difficulty: row[DataBaseController.cache_difficulty], terrain: row[DataBaseController.cache_terrain], size: row[DataBaseController.cache_size], owner: row[DataBaseController.cache_owner], hint: row[DataBaseController.cache_hint], description: row[DataBaseController.cache_description])
                return cache
            }
        } catch {
            print("get cache failed : \(error)")
        }
        return nil
    }
    
    func getCacheById(id: Int) -> Cache? {
        let query = super.cache_table.filter(DataBaseController.cache_id == id)
        let cache = self.getCache(query: query)
        return cache
    }
    
    func deleteCacheById(id: Int)  {
        let query = super.cache_table.filter(DataBaseController.cache_id == id)
        do {
            try  super.database.run(query.delete())
        } catch {
            print("delete cache failed : \(error)")
        }
        
    }
    
    func getAllCache() -> Array<Cache> {
        var caches: [Cache] = []
        
        do {
            for row in try super.database.prepare(super.cache_table) {
                let cache: Cache = Cache.init(id: row[DataBaseController.cache_id], lat: row[DataBaseController.cache_lat], lon: row[DataBaseController.cache_lon], type: row[DataBaseController.cache_type], difficulty: row[DataBaseController.cache_difficulty], terrain: row[DataBaseController.cache_terrain], size: row[DataBaseController.cache_size], owner: row[DataBaseController.cache_owner], hint: row[DataBaseController.cache_hint], description: row[DataBaseController.cache_description])
                caches.append(cache)
            }
        } catch {
            print("getAllCache failed : \(error)")
        }
        return caches
    }
}
