////
////  Dorm.swift
////  cphDorms
////
////  Created by Niclas Lach on 23.04.21.
////
//
//import Foundation
//
//
//struct Dorm: Decodable, Identifiable {
//    var id: String {
//        return uuid
//    }
//    let name: String
//    let uuid: String
//    let address: String
//    let dormPictureLink: String
//    struct coordinates: Decodable {
//        let latitude: Double?
//        let longitude: Double?
//    }
//    let description: [String]
//    let rooms: [Room]
//    
//    let maxPrice: Double
//    let minPrice: Double
//    let maxSize: Double
//    let minSize: Double
//}
//
//
//struct Room: Decodable {
//    let roomType: String
//    let size: Double
//    let price: Double
//}
