//
//  Info.swift
//  SideMenu
//
//  Created by Pankaj Talreja on 08/02/21.
//

import SwiftUI
import Combine

///Starting point of SideBar Menu. Set Container View(Content View), hideSideBar Values
@available(iOS 13.0, *)
public struct PTSideBarMenu: View {
    
    /// Retrun seleted Row
    let selectedRow: (Int) -> ()
    
    ///Set Content View(Contianer view)
    let contentView: AnyView
    
    ///Assign Show/Hide Side Bar
    @Binding var hideSideBar: Bool

    ///Set the X axis offset
    @State private var xOffset: CGFloat = .zero

    
    public init(selectedRow: @escaping (Int) -> (), contentView: AnyView, hideSideBar: Binding<Bool>) {
        self.selectedRow = selectedRow
        self.contentView = contentView
        self._hideSideBar = hideSideBar
    }
    
    
    public var body: some View {
        ZStack {
            PTSideBarMenuParentView(hideSideBar: $hideSideBar, selectedRow: selectedRow)
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
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}


struct PTSideBarMenuParentView: View {
//    @EnvironmentObject var configuration: PTSiderBarConfiguration
    @Binding var hideSideBar: Bool

    @State private var xOffset: CGFloat = .zero
//    @Binding var hideSideBar: Bool

    let selectedRow: (Int) -> ()

    var body: some View {
        GeometryReader { geometry in
            PTSideBarMenuView(didSelectRowAt: selectedRow,geometry: geometry)
                .offset(x: hideSideBar ? -(geometry.size.width) / 2 : xOffset, y: 0)
                .animation(.easeIn)
            
            
        }
    }

}
