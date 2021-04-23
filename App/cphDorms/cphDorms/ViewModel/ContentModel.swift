//
//  ContentModel.swift
//  cphDorms
//
//  Created by Niclas Lach on 23.04.21.
//

import SwiftUI

class ContentModel: ObservableObject {
    @Published var dorms = [Dorms]()
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        let jsonUrl = Bundle.main.url(forResource: "json_kkik", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            let dorms = try jsonDecoder.decode([Dorms].self, from: jsonData)
            
            self.dorms = dorms
        } catch {
            print("Couldn't parse local JSON")
        }
    }
}

