//
//  CricketMarkView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 7/30/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct CricketMarkView: View {
    var marks: Int
    var showPoints: Bool = true
    
    var overThree: Bool { self.marks > 3 && self.showPoints }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ZStack(alignment: .leading) {
                    Path { path in
                        let height: CGFloat = geometry.size.height
                        let width: CGFloat = self.overThree ? geometry.size.width / 1.5 : geometry.size.width
                        let space: CGFloat = (width - height) / 2
                        let insetRatio: CGFloat = 0.1

                        if (self.marks >= 1) {
                            path.move(to: CGPoint(x: (height * (1-insetRatio)) + space, y: height * (1-insetRatio)))
                            path.addLine(to: CGPoint(x: (height * insetRatio) + space, y: height * insetRatio))
                        }
                        if (self.marks >= 2) {
                            path.move(to: CGPoint(x: (height * insetRatio) + space, y: height * (1-insetRatio)))
                            path.addLine(to: CGPoint(x: (height * (1-insetRatio)) + space, y: height * insetRatio))
                        }
                        if (self.marks >= 3) {
                            let radius: CGFloat = height * 0.35
                            path.move(to: CGPoint(x: width - ((width - radius*2)/2), y: height * 0.5))
                            path.addArc(center: CGPoint(x: width * 0.5, y: height * 0.5), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
                            path.addArc(center: CGPoint(x: width * 0.5, y: height * 0.5), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 360), clockwise: true)
                        }
                    }
                    .stroke(Color.select(.secondary), lineWidth: CGFloat(4))
                }
                .frame(width: self.overThree ? geometry.size.width / 2 : geometry.size.width)
                
                if self.overThree {
                    Spacer()
                    Text("\(self.marks - 3)")
                        .foregroundColor(Color.select(.secondary))
                    Spacer()

                }
            }
        }
    }
}

#if DEBUG
struct CricketMarkView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CricketMarkView(marks: 1)
                .previewLayout(.fixed(width: 150, height: 75))
            CricketMarkView(marks: 2)
                .previewLayout(.fixed(width: 150, height: 75))
            CricketMarkView(marks: 3)
                .previewLayout(.fixed(width: 150, height: 75))
            CricketMarkView(marks: 4)
                .previewLayout(.fixed(width: 150, height: 75))
        }
    }
}
#endif
