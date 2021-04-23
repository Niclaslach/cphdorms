//
//  AllDormsView.swift
//  cphDorms
//
//  Created by Niclas Lach on 23.04.21.
//

import SwiftUI

struct AllDormsView: View {
    
    @EnvironmentObject var viewModel: ContentModel
    @State private var showFilter = false
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(viewModel.dorms.indices) { index in
                        
                        VStack (spacing: 20) {
                            
                            NavigationLink(
                                destination:
                                    Text("destination"),
                                label: {
                                    
                                    // Learning Card
                                    //Text(dorm.name)
                                    DormRow(dorm: viewModel.dorms[index], image: viewModel.dormImages[index])
                                })
                            
                        }
                    }
                    
                }
                .accentColor(.black)
                .padding()
                
            }
            .navigationTitle(" CPH Dorms")
            .toolbar {
                NavigationLink (
                    destination: Text("Filter"),
                    label: {
                        HStack {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                            //Text("Filter")
                        }
                    })
            }
        }
    }
}

struct FilterView: View {
    var body: some View {
        VStack {
            Text("Filter").font(.headline)
            Divider()
            //Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
            
        }.padding()
    }
}




struct AllDormsVie_Previews: PreviewProvider {
    static var previews: some View {
        AllDormsView()
            .environmentObject(ContentModel())
    }
}
