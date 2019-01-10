

import Foundation


public class Cache  {


    var id: Int
    var lat: Double
    var lon: Double
    var type: Int
	var difficulty: Int
    var terrain: Int
    var size: Int
	var owner: Int
	var hint: String
	var description: String
    
    init() {
		id = ?
		lat = ?
		lon = ? 
		type = ?
		difficulty = ?
		terrain = ?
		size = ?
		owner = ?
		hint = "?"
		description = "?"
    }
    
    init(id: Int,lat: Double,lon: Double,type: Int,difficulty: Int,terrain: Int,size: Int,owner: Int,hint: String,description: String) {
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
    
    public var descriptor: String {
        return "Cache(\(id),\(lat),\(lon),\(type)\(difficulty)\(terrain)\(size)\(owner)\(hint)\(description))"
    }
}
