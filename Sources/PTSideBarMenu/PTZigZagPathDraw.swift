//
//  PTZigZagPathDraw.swift
//  SideMenu
//
//  Created by Pankaj Talreja on 11/02/21.
//

import SwiftUI

/// Draws ZigZag Pattern
@available(iOS 13.0, *)
internal struct PTZigZagPathDraw: View {
    @EnvironmentObject var configuration: PTSiderBarConfiguration
    var geometry: GeometryProxy
    var body: some View {
          
        Path { path in
            let x = geometry.frame(in: .local).minX
            let y = geometry.frame(in: .local).maxY - configuration.zigZagHeight
            
            path.move(to: CGPoint(x: x, y: y))
            let width: Int = Int(geometry.size.width)
            for index in (0 ..< width - Int((configuration.zigZagWidth / 2.0))) {
                if index % Int((configuration.zigZagWidth / 2.0)) == 0 && index % Int(configuration.zigZagWidth) == 0 {
                    path.addLine(to: CGPoint(x: CGFloat(index) + (configuration.zigZagWidth / 2.0), y: y + configuration.zigZagHeight))

                } else if index % Int((configuration.zigZagWidth / 2.0)) == 0 {
                    path.addLine(to: CGPoint(x: CGFloat(index) + (configuration.zigZagWidth / 2.0), y: y))

                }
            }
        }
        .stroke(Color.white, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
    }
}
