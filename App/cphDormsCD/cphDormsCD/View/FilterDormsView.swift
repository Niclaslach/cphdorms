//
//  FilterDormsView.swift
//  cphDorms
//
//  Created by Niclas Lach on 25.04.21.
//

import SwiftUI

struct FilterDormsView: View {
    @Binding var dormSearch: DormSearch
    @Binding var showFilter: Bool
    
    @State private var draft: DormSearch
    
    init(dormSearch: Binding<DormSearch>, showFilter: Binding<Bool>) {
        _dormSearch = dormSearch
        _showFilter = showFilter
        
        _draft = State(wrappedValue: dormSearch.wrappedValue)
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Text("Filter")
            }
                .navigationTitle("Filter Dorms")
                .navigationBarItems(leading: cancel, trailing: done)
        }
    }
    
    var cancel: some View {
        Button("Cancel") {
            showFilter = false
        }
    }
    
    var done: some View {
        Button("Done") {
            dormSearch = draft
            showFilter = false
        }
    }
}

//struct FilterDormsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterDormsView()
//    }
//}
