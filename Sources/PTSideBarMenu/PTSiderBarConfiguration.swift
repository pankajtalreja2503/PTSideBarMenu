//
//  PTSiderBarConfiguration.swift
//  SideMenu
//
//  Created by Pankaj Talreja on 11/02/21.
//

import SwiftUI

@available(iOS 13.0, *)
public class PTSiderBarConfiguration: ObservableObject {
    
    /// ///Select The border design
    let dividerDesign: DividerDesigns = .ZigZag
    
    ///List of Items which need to display
    let sideBarItems: [PTSideBarModel]
    
    /// Set Hide sidebar
//    @Binding public var hideSideBar: Bool
    
    private let customeRowValue: AnyView? = nil
    
    ///Selected Items from the Menu
    public var selectedRow = 0
    
    /// Set Backgroud Color of Row
    public var backgroudColorOfRow: Color = . accentColor
    
    /// Set Backgroud Color of Menu
    public var backgroundColorOfMenu: Color = .accentColor
    
    /// Set Text Color of Menu
    public var menuTextColor: Color = .white
    
    /// Set ZigZag Pattern Height
    public var zigZagHeight:CGFloat  = 5
    /// Set ZigZag Pattern width
    public var zigZagWidth: CGFloat = 40
    
    ///set frame height and Width of image
    public var sizeOfImage: (CGFloat, CGFloat) = (40, 40)
    
    ///set background color of Image
    public var backgroundColorOfImage = Color.clear
    
    ///set accent color of image
    public var accentColorOfImage = Color.clear

    ///set foreground color of image
    public var foregroundColorOfImage = Color.clear

//        .accentColor(Color.clear)
    
//    public var hideSideBar: Bool = true
    
    /// Initilize initial values for Side Menu: Divider Design, Items to display
    public init(dividerdesign: DividerDesigns, items: [PTSideBarModel] ) throws {
        self.sideBarItems = items
//        self._hideSideBar = hideSideBar
    }
    
//    public func toggleSideBar() {
//        hideSideBar.toggle
//    }
    
//    public func initiateMenu(selectedRow:@escaping (Int) -> (), contentView: AnyView ) -> AnyView {
//        AnyView(PTSideBarMenu(selectedRow: selectedRow, contentView: contentView) )
//    }
    
}
