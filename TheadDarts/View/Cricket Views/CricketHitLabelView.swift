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

  var rows: CGFloat {
    get {
      return bullRequired ? 7 : 6
    }
  }
  let columns: CGFloat = 1
  let spacing: CGFloat = 5

  func getItemWidth(containerWidth: CGFloat) -> CGFloat {
    return (containerWidth - spacing * (columns - 1)) / columns
  }
  
  func getItemHeight(containerHeight: CGFloat) -> CGFloat {
    return (containerHeight - spacing * (rows - 1)) / rows
  }
    
  var body: some View {
    GeometryReader { geometry in
      VStack(alignment: .center, spacing: self.spacing) {
        ForEach(Wedge.cricketWedgeLabels(isBoolRequired: bullRequired), id: \.self) { label in
          Text(label)
          .frame(width: self.getItemWidth(containerWidth: geometry.size.width),
                 height: self.getItemHeight(containerHeight: geometry.size.height))
        }
      }
      .frame(maxWidth: .infinity)
      .font(.largeTitle)
    }
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
