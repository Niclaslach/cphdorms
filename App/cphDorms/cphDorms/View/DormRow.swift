//
//  DormRow.swift
//  cphDorms
//
//  Created by Niclas Lach on 23.04.21.
//

import SwiftUI

struct DormRow: View {
    var dorm: Dorm
    var image: UIImage?
//    var title: String
//    var description: String
//    var count: String
//    var time: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                //.aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                
            
            HStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 116, height: 116)
                }
                // Image
//                Image(image)
//                    .resizable()
//                    .frame(width: 116, height: 116)
//                    .clipShape(Circle())
                
                Spacer()
                
                // Text
                VStack (alignment: .leading, spacing: 10) {
                    
                    // Headline
                    Text(dorm.name)
                        .bold()
                    
                    // Description
                    Text(dorm.address)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    // Icons
                    HStack {
                        
                        // Number of lessons/questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("count")
                            .font(Font.system(size: 10))
                        
                        Spacer()
                        
                        // Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("time")
                            .font(Font.system(size: 10))
                        
                    }
                }
                .padding()
                .padding(.leading, 20)
            }
            .padding(.horizontal, 20)
            
        }
        
        
    }
}

struct DormRow_Previews: PreviewProvider {
    
    static var previews: some View {
        DormRow_Preview()
            .environmentObject(ContentModel())
        
    }
}

struct DormRow_Preview: View {
    
    @EnvironmentObject var viewModel: ContentModel
    @State private var showFilter = false
    
    var body: some View {
        DormRow(dorm: viewModel.dorms[0], image: viewModel.dormImages[0])
            .frame(width: .infinity, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding()
    }
}
