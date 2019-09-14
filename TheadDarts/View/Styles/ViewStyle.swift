//
//  ViewStyle.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/11/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 2, cornerRadius: CGFloat = 25, condition: Bool = true) -> some View where S : ShapeStyle {
        if condition {
            return overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content, lineWidth: width))
        } else {
            return overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content, lineWidth: 0))
        }
    }
}
