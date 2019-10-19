//
//  ThemeCardView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 10/19/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct ThemeCardView: View {

    @ObservedObject var settings = UserSettings()

    @State var selectingTheme = false
    
    // MARK: Body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Theme")
                .padding()
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.select(.hitBackground))
            
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                .foregroundColor(Color.select(.primary))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Selected Theme:")
                        .font(.title)
                    Button(action: {
                        withAnimation {
                            self.selectingTheme.toggle()
                        }
                    }) {
                        Text("\(self.settings.theme)")
                            .padding()
                    }
                    .foregroundColor(Color.select(.secondary))
                    .background(Color.select(.hitBackground))
                    .cornerRadius(25)
                    .addBorder(Color.select(.primary), width: 2)
                }
                
                themeGrid
                    .transition(.slideInFadeUp)
                    .padding(.top, 3)
            }
            .padding()
        }
        .navigationBarHidden(false)
        .cornerRadius(25)
        .addBorder(Color.select(.primary), width: 2)
        .padding(.top)
    }
    
    let themeArray: [[UserSettings.Theme]] = [[.blue, .green, .indigo],
                                              [.orange, .pink, .purple],
                                              [.red, .teal, .yellow]]
    
    var themeGrid: some View {
        VStack(spacing: 5) {
            ForEach(0..<self.themeArray.count, id: \.self) { rowIndex in
                HStack(spacing: 5) {
                    ForEach(self.themeArray[rowIndex], id: \.self) { theme in
                        Button( action: {
                            withAnimation {
                                self.settings.theme = theme.rawValue
                                self.selectingTheme.toggle()
                            }
                        }) {
                            Text("\(theme.rawValue)")
                                .padding()
                                .font(.headline)
                                .frame(maxWidth: 150)
                        }
                        .background(Color.select(.hitBackground))
                        .foregroundColor(Color.getColorNamed(theme.rawValue))
                        .cornerRadius(25)
                        .addBorder(Color.select(.primary), width: 2)
                    }
                }
            }
        }
    }
}

struct ThemeCardView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeCardView()
    }
}
