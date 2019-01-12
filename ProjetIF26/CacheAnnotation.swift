//
//  CacheAnnotation.swift
//  ProjetIF26
//
//  Created by oui on 11/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

import MapKit

class CacheAnnotation: NSObject, MKAnnotation{
    
    let id: Int
    let type: Int
    
   
    let coordinate: CLLocationCoordinate2D
    
    init(id: Int, type:Int, coordinate: CLLocationCoordinate2D) {

        self.id = id
        self.type = type
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String?{
        return String(type)
    }
    
    var markerTintColor: UIColor  {
        switch type {
        case 1:
            return .red
        case 2:
            return .green
        case 3:
            return .purple
        default:
            return .red
        }
    }
    
}
