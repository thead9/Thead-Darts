//
//  CricketHitLabelView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 7/6/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct CricketHitLabelView : View {
  var bullRequired: Bool = true
  
  var body: some View {
    VStack(alignment: .center) {
      ForEach(Wedge.cricketWedgeLabels(isBoolRequired: bullRequired), id: \.self) { label in
        Text(label)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
    }
    .font(.largeTitle)
  }
}

#if DEBUG
struct CricketHitLabelView_Previews : PreviewProvider {
  static var previews: some View {
    CricketHitLabelView()
      .previewLayout(.fixed(width: 75, height: 650))
  }
}
#endif
