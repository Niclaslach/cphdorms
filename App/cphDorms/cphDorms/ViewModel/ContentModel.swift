//
//  ContentModel.swift
//  cphDorms
//
//  Created by Niclas Lach on 23.04.21.
//

import SwiftUI

class ContentModel: ObservableObject {
    @Published var dorms = [Dorm]()
    
    @Published private(set) var dormImages = [UIImage?]()
    
    init() {
        getLocalData()
        
        fetchDormImages()
    }
    
    private func getLocalData() {
        let jsonUrl = Bundle.main.url(forResource: "json_kkik", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            let dorms = try jsonDecoder.decode([Dorm].self, from: jsonData)
            
            self.dorms = dorms
            self.dormImages = [UIImage?](repeating: nil, count: dorms.count)
        } catch {
            print("Couldn't parse local JSON")
        }
    }
    
    private func getRemoteData() {
        
        let urlString = "https://192.168.0.103:3000/api/json"
        
        let url = URL(string: urlString)!
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let dorms = try jsonDecoder.decode([Dorm].self, from: data!)
                self.dorms = dorms
            } catch { return }
            
        }
        
        dataTask.resume()
    }
    
    
    private func fetchDormImages() {
        dormImages = [UIImage?](repeating: nil, count: dorms.count)
        for (index, dorm) in dorms.enumerated() {
            if let url = URL(string: dorm.dormPictureLink) {
                DispatchQueue.global(qos: .userInitiated).async {
                    if let imageData = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.dormImages[index] = UIImage(data: imageData)
                        }
                    }
                }
            }
        }
    }
}

