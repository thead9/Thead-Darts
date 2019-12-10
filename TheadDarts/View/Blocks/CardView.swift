//
//  CardView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 12/9/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct CardView<ContentView:View>: View {
    
    let title: String
    let content: ContentView
    
    init (title: String, _ content: () -> (ContentView)) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(title)")
                .textStyle(CardTitleTextStyle())
            
            Rectangle()
                .frame(minHeight: 2, maxHeight: 2)
                .foregroundColor(Color.select(.primary))
                
            content
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Test Title") {
            VStack{
                Text("Row 1")
                Text("Row 2")
            }
        }
    }
}
