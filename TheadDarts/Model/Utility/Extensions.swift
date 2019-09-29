//
//  Extensions.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/29/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
  
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

final class UserSettings: ObservableObject {
    var objectWillChange = PassthroughSubject<Void, Never>()

    @UserDefault(key: "x01StartingPoint", defaultValue: 301)
    var x01StartingPoint: Int {
        didSet {
            objectWillChange.send()
        }
    }
    
    @UserDefault(key: "doubleOut", defaultValue: true)
    var doubleOut: Bool {
        didSet {
            objectWillChange.send()
        }
    }
    
    @UserDefault(key: "trackTurns", defaultValue: true)
    var trackTurns: Bool {
        didSet {
            objectWillChange.send()
        }
    }
}
