//
//  Info.swift
//  SideMenu
//
//  Created by Pankaj Talreja on 08/02/21.
//

import SwiftUI
import Combine

@available(iOS 13.0, *)
struct PTSideBarMenu: View {
    @Binding var hideSideBar: Bool
    let selectedRow: (Int) -> ()
    @State private var xOffset: CGFloat = .zero

    
    public var body: some View {
            GeometryReader { geometry in
                PTSideBarMenuView(didSelectRowAt: selectedRow,geometry: geometry)
                    .offset(x: hideSideBar ? -(geometry.size.width) / 2 : xOffset, y: 0)
                    .animation(.easeIn)
                
                
            }
    }
    
}
