//
//  SettingsCardView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 12/9/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct SettingsCardView: View {
    @ObservedObject var settings = UserSettings()

    var doneAction = { }
    
    var body: some View {
        CardView(title: "Settings") {
            VStack(alignment: .leading) {
                HStack {
                    Text("Theme:")
                        .font(.title)
                    Text("\(self.settings.theme)")
                        .padding()
                        .foregroundColor(Color.select(.secondary))
                        .background(Color.select(.hitBackground))
                        .cornerRadius(25)
                        .addBorder(Color.select(.primary), width: 2)
                }
                
                themeGrid
                    .transition(.slideInFadeUp)
                    .padding(.top)
                
                Button(action: {
                    withAnimation {
                        self.doneAction()
                    }
                }) {
                    Text("Done")
                        .padding()
                        .font(.title)
                }
                .buttonStyle(SecondaryButtonStyle())
                .padding(.top)
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
                            }
                        }) {
                            Text("\(theme.rawValue)")
                                .padding(.vertical)
                                .font(.headline)
                                .frame(maxWidth: 150)
                        }
                        .buttonStyle(SecondaryButtonStyle(foregroundColor: Color.getColorNamed(theme.rawValue), useScaleEffect: false))
                    }
                }
            }
        }
    }
}

struct SettingsCardView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCardView()
    }
}
