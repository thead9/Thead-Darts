//
//  ColorSelector.swift
//  TheadDarts
//
//  Created by Thomas Headley on 10/12/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    enum ColorPurpose {
        case primary
        case secondary
        case hitBackground
        case background
    }
    
    static func select(_ colorPurpose: ColorPurpose) -> Color {
        switch colorPurpose {
        case .primary:
            return Color("Primary")
        case .secondary:
            return secondaryColor()
        case .hitBackground:
            return Color("HitBackground")
        case .background:
            return Color("Background")
        }
    }
    
    static func secondaryColor() -> Color {
        let settings = UserSettings()
        
        return getColorNamed(settings.theme)
    }
    
    static func getColorNamed(_ name: String) -> Color {
        switch name {
        case "Blue":
            return Color(.systemBlue)
        case "Green":
            return Color(.systemGreen)
        case "Indigo":
            return Color(.systemIndigo)
        case "Orange":
            return Color(.systemOrange)
        case "Pink":
            return Color(.systemPink)
        case "Purple":
            return Color(.systemPurple)
        case "Red":
            return Color(.systemRed)
        case "Teal":
            return Color(.systemTeal)
        case "Yellow":
            return Color(.systemYellow)
        default:
            return Color(.systemBlue)
        }
    }
}
