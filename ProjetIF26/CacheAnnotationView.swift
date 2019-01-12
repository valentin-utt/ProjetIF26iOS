//
//  CacheAnnotationView.swift
//  ProjetIF26
//
//  Created by oui on 11/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

import MapKit

class CacheAnnotationView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            // 1
            guard let cacheAnnot = newValue as? CacheAnnotation else { return }
            // 2
            markerTintColor = cacheAnnot.markerTintColor
            glyphText = String("Cache")
        }
    }
}
