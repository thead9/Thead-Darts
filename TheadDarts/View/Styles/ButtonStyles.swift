//
//  ButtonStyles.swift
//  TheadDarts
//
//  Created by Thomas Headley on 11/1/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(Color.select(.secondary))
            .foregroundColor(Color.select(.background))
            .cornerRadius(25)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    var addBorder = true
    var foregroundColor = Color.select(.secondary)
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(Color.select(.background))
            .foregroundColor(foregroundColor)
            .cornerRadius(25)
            .addBorder(Color.select(.primary), condition: addBorder)
    }
}
