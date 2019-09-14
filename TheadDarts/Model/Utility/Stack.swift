//
//  Stack.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/2/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import Foundation

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func peek() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.last
    }
}
