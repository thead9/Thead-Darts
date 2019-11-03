//
//  Transitions.swift
//  TheadDarts
//
//  Created by Thomas Headley on 11/3/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var slideInFadeUp: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .top)
            .combined(with: .opacity)
            .combined(with: .scale)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var slideAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
