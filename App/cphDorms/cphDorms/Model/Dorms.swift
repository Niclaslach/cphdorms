//
//  Dorms.swift
//  cphDorms
//
//  Created by Niclas Lach on 23.04.21.
//

import Foundation


struct Dorms: Decodable, Identifiable {
    var id: String {
        return uuid
    }
    let name: String
    let uuid: String
    let address: String
    let dormPictureLink: String
    struct coordinates: Decodable {
        let latitude: String
        let longitude: String
    }
    let description: String
    let rooms: [Rooms]
    
}


struct Rooms: Decodable {
    let roomType: String
    let size: String
    let price: String
}
