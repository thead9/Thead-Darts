//
//  TextStyles.swift
//  TheadDarts
//
//  Created by Thomas Headley on 11/2/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation
import SwiftUI

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

// This extension is so SF Symbols can make use of these Text Styles as well
extension Image {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct CardTitleTextStyle: ViewModifier {
    
    // This is a band-aid to allow for background color changes in init(backgroundColor) when the theme changes
    // TODO: Figure out how to get this to change on theme change
    var backgroundColor = Color.select(.secondary)
    
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.largeTitle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(backgroundColor)
    }
}

struct ThrowTextStyle: ViewModifier {
    var label: String
    
    init(_ label: String) {
        self.label = label
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .foregroundColor(label.contains("T") ? Color.select(.hitBackground) : Color.select(.primary) )
            .addBorder((label.contains("T") ? Color.select(.hitBackground) : Color.select(.secondary)), width: 1)
    }
}

struct GameControlTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 125)
            .font(.title)
    }
}
