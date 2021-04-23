//
//  ContentView.swift
//  cphDorms
//
//  Created by Niclas Lach on 23.04.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AllDormsView()
                .tabItem {
                    VStack {
                        Image(systemName: "building.2")
                        Text("All Dorms")
                    }
                }.tag(1)
            DormMatchView()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle")
                    Text("Find Dorm")
                }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
