//
//  Info.swift
//  SideMenu
//
//  Created by Pankaj Talreja on 08/02/21.
//

import SwiftUI
import Combine

@available(iOS 13.0, *)
public struct PTSideBarMenu: View {
    let selectedRow: (Int) -> ()
    let contentView: AnyView
    
    public init(selectedRow: @escaping (Int) -> (), contentView: AnyView) {
        self.selectedRow = selectedRow
        self.contentView = contentView
    }
    @State private var xOffset: CGFloat = .zero
    
    public var body: some View {
        ZStack {
            
            PTSideBarMenuParentView(selectedRow: selectedRow)
            .zIndex(1)
            WindowContentView {
                contentView
            }
            
        }
    }
    
}


@available(iOS 13.0, *)
struct WindowContentView<Content: View>: View {
    let content: Content

    var body: some View {
        content
    }
    init(@ViewBuilder content: () -> Content ) {
        self.content = content()
    }
}


struct PTSideBarMenuParentView: View {
    @EnvironmentObject var configuration: PTSiderBarConfiguration

    @State private var xOffset: CGFloat = .zero

    let selectedRow: (Int) -> ()

    var body: some View {
        GeometryReader { geometry in
            PTSideBarMenuView(didSelectRowAt: selectedRow,geometry: geometry)
                .offset(x: configuration.hideSideBar ? -(geometry.size.width) / 2 : xOffset, y: 0)
                .animation(.easeIn)
            
            
        }
    }

}
