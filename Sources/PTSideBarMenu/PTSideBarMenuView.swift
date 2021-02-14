//
//  PTSideBarMenuView.swift
//  SideMenu
//
//  Created by Pankaj Talreja on 10/02/21.
//

import SwiftUI
import Combine


@available(iOS 13.0, *)
struct PTSideBarMenuView: View {
    let didSelectRowAt: (Int) -> Void
    let geometry: GeometryProxy
    @EnvironmentObject var configuration: PTSiderBarConfiguration
    var body: some View {
            PTSideBarContentView (didSelectRowAt: didSelectRowAt)
                .frame(width: geometry.size.width / 2, height: geometry.size.height, alignment: .top)
                .background(configuration.backgroundColorOfMenu)
    }
}
