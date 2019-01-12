//
//  Cache.swift
//  ProjetIF26
//
//  Created by Vincent on 09/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//
class Cache {
    
    private var id: Int
    private var lat: Double
    private var lon: Double
    private var type: Int
    private var difficulty: Int
    private var terrain: Int
    private var size: Int
    private var owner: Int
    private var hint: String
    private var description: String
    
    init(id: Int, lat: Double, lon: Double, type: Int, difficulty: Int, terrain: Int, size: Int, owner: Int, hint: String, description: String) {
        self.id = id
        self.lat = lat
        self.lon = lon
        self.type = type
        self.difficulty = difficulty
        self.terrain = terrain
        self.size = size
        self.owner = owner
        self.hint = hint
        self.description = description
    }
    
    init(lat: Double, lon: Double, type: Int, difficulty: Int, terrain: Int, size: Int, owner: Int, hint: String, description: String) {
        self.id = -1
        self.lat = lat
        self.lon = lon
        self.type = type
        self.difficulty = difficulty
        self.terrain = terrain
        self.size = size
        self.owner = owner
        self.hint = hint
        self.description = description
    }
    
    func getId() -> Int {
        return self.id
    }
    
    func setId(id: Int) {
        return
    }
    
    func getLat() -> Double {
        return self.lat
    }
    
    func setLat(lat: Double) {
        self.lat = lat
    }
    
    func getLon() -> Double {
        return self.lon
    }
    
    func setLon(lon: Double) {
        self.lon = lon
    }
    
    func getType() -> Int {
        return self.type
    }
    
    func setType(type: Int) {
        self.type = type
    }
    
    func getDifficulty() -> Int {
        return self.difficulty
    }
    
    func setDifficulty(difficulty: Int) {
        self.difficulty = difficulty
    }
    
    func getTerrain() -> Int {
        return self.terrain
    }
    
    func setTerrain(terrain: Int) {
        self.terrain = terrain
    }
    
    func getSize() -> Int {
        return self.size
    }
    
    func setSize(size: Int) {
        self.size = size
    }
    
    func getOwner() -> Int {
        return self.owner
    }
    
    func setOwner(owner: Int) {
        self.owner = owner
    }
    
    func getHint() -> String {
        return self.hint
    }
    
    func setHint(hint: String) {
        self.hint = hint
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func setDescription(description: String) {
        self.description = description
    }
    
    func toString() -> String {
        return "Cache : id -> \(self.id) / lat -> \(self.lat) / lon -> \(self.lon) / type -> \(self.type) / difficulté -> \(self.difficulty) / terrain -> \(self.terrain) / taille -> \(self.size) / owner -> \(self.owner) / hint -> \(self.hint) / description -> \(self.description)"
    }
    
}
