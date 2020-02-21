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
    var useScaleEffect = true
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(Color.select(.secondary))
            .foregroundColor(Color.select(.background))
            .cornerRadius(25)
            .scaleEffect(configuration.isPressed && useScaleEffect ? 0.9 : 1.0)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    var addBorder = true
    var foregroundColor = Color.select(.secondary)
    var useScaleEffect = true
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(Color.select(.hitBackground))
            .foregroundColor(foregroundColor)
            .cornerRadius(25)
            .addBorder(Color.select(.primary), condition: addBorder)
            .scaleEffect(configuration.isPressed && useScaleEffect ? 0.9 : 1.0)
    }
}

struct PrimarySecondaryButtonStyle: ButtonStyle {
    let isPrimary: Bool
    let useScaleEffect = true
    
    init(isPrimary: Bool) {
        self.isPrimary = isPrimary
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(isPrimary ? Color.select(.secondary) : Color.select(.hitBackground))
            .foregroundColor(isPrimary ? Color.select(.background) : Color.select(.secondary))
            .cornerRadius(25)
            .addBorder(Color.select(.primary), condition: !isPrimary)
            .scaleEffect(configuration.isPressed && useScaleEffect ? 0.9 : 1.0)
    }
}

struct CancelButtonStyle: ButtonStyle {
    var useScaleEffect = true

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(Color(.gray))
            .foregroundColor(Color.select(.background))
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed && useScaleEffect ? 0.9 : 1.0)
    }
}

struct DestructiveButtonStyle: ButtonStyle {
    var useScaleEffect = true
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(Color.red)
            .foregroundColor(Color.select(.background))
            .cornerRadius(25)
            .scaleEffect(configuration.isPressed && useScaleEffect ? 0.9 : 1.0)
    }
}
