//
//  ViewUtilities.swift
//  TheadDarts
//
//  Created by Thomas Headley on 8/14/20.
//  Copyright © 2020 Thead. All rights reserved.
//

import SwiftUI

struct HiddenNavigationBar: ViewModifier {
  @State var isHidden = false
  
  func body(content: Content) -> some View {
    content
      .navigationBarTitle("", displayMode: .inline)
      .navigationBarHidden(isHidden)
      .onAppear { self.isHidden = true }
  }
}

extension View {
  func hiddenNavigationBarStyle() -> some View {
    modifier( HiddenNavigationBar() )
  }
}
