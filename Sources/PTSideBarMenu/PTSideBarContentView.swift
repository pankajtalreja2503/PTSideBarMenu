//
//  PTSideBarContentView.swift
//  SideMenu
//
//  Created by Pankaj Talreja on 10/02/21.
//

import SwiftUI
import Combine



@available(iOS 13.0, *)
struct PTSideBarContentView: View {
    
    @EnvironmentObject var configuration: PTSiderBarConfiguration
    let didSelectRowAt: (Int) -> Void

    var body: some View {
        if #available(iOS 14.0, *) {
            LazyVStack(alignment: .center, spacing: 5) {
                ForEach(0 ..< self.configuration.sideBarItems.count) { index in
                    PTRowContentView(item: self.configuration.sideBarItems[index],didSelectRowAt: didSelectRowAt,index: index)
                        .background(configuration.backgroudColorOfRow)
                    
                }
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
}


