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

struct GeometryPreferenceReader<K: PreferenceKey, V> where K.Value == V {
    let key: K.Type
    let value: (GeometryProxy) -> V
}

extension GeometryPreferenceReader: ViewModifier {
  func body(content: Content) -> some View {
    content
      .background(GeometryReader {
        Color.clear.preference(key: self.key,value: self.value($0))
      })
  }
}

protocol EqualLength {}

struct AppendValue<T: EqualLength>: PreferenceKey {
  static var defaultValue: [CGFloat] { [] }
  static func reduce(value: inout Value, nextValue: () -> Value) {
    value.append(contentsOf: nextValue())
  }
  typealias Value = [CGFloat]
}

extension View {
  func assignEqualLength<K: PreferenceKey>(
    for key: K.Type,
    to binding: Binding<CGFloat?>) -> some View where K.Value == [CGFloat] {

    return self.onPreferenceChange(key.self) { preferences in
      let maxPreference = preferences.reduce(0, max)
      if maxPreference > 0 {
        // only set value if > 0 to avoid pinning sizes to zero
        binding.wrappedValue = maxPreference
      }
    }
  }

  func readEqualLength<K: PreferenceKey, V>(_ length: GeometryPreferenceReader<K, V>) -> some View {
    modifier(length)
  }
}

struct IgnoresKeyboardSafeArea: ViewModifier {
  func body(content: Content) -> some View {
    ScrollView([]) {
      content
    }
    .ignoresSafeArea(.keyboard, edges: .bottom)
  }
}

extension View {
  @ViewBuilder
  func ignoresKeyboardSafeArea(_ ignores: Bool = true) -> some View {
    if ignores {
      self.modifier(IgnoresKeyboardSafeArea())
    }
    else {
      self
    }
  }
}
