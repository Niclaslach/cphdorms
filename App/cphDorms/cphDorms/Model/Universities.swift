//
//  Universities.swift
//  cphDorms
//
//  Created by Niclas Lach on 24.04.21.
//

import Foundation

struct Universities: Decodable, Identifiable {
    var id: String {
        return abbreviation
    }
    
    let name: String
    let abbreviation: String
    let campuses: [Campus]
}


struct Campus: Decodable, Identifiable {
    var id: String {
        return abbreviation
    }
    
    let name: String
    let abbreviation: String
    
    struct coordinates: Decodable {
        let latitude: Double?
        let longitude: Double?
    }
}
