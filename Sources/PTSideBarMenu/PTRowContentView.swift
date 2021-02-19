//
//  PTRowContentView.swift
//  SideMenu
//
//  Created by Pankaj Talreja on 11/02/21.
//

import SwiftUI

@available(iOS 13.0, *)
struct PTRowContentView: View {
    var item: PTSideBarModel
    let didSelectRowAt: (Int) -> Void
    let index: Int
    @EnvironmentObject var configuration: PTSiderBarConfiguration
    
    var body: some View {
        VStack(alignment: .leading) {
            setTitleAndImage()
            GeometryReader { geometry in
                getBorderDesign(geometry: geometry)

         }
        }

    }
    
    private func setRowView() -> AnyView {
//        if let customRow = configuration.customeRowValue {
//            return customRow
//        } else {
            return setTitleAndImage()
//        }
    }
    private func setTitleAndImage() -> AnyView {
        return AnyView (
            RowView {
                Button(action: { didSelectRowAt(index) }, label: {
                    HStack {
                        Group {
                            if let imageString = item.imageName {
                                Image(imageString)
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: configuration.sizeOfImage.0, height: configuration.sizeOfImage.1)
                                    .padding(.top, 10)
                                    .background(configuration.backgroundColorOfImage)
                                    .accentColor(configuration.accentColorOfImage)
                                    .foregroundColor(configuration.foregroundColorOfImage)


                            } else if let imageData = item.image {
                                imageData
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: configuration.sizeOfImage.0, height: configuration.sizeOfImage.1)
                                    .padding(.top, 10)
                                    .background(configuration.backgroundColorOfImage)
                                    .accentColor(configuration.accentColorOfImage)
                                    .foregroundColor(configuration.foregroundColorOfImage)

                            }
                            if let textValue = item.title {
                                Text(textValue).foregroundColor(configuration.menuTextColor)
                                    .font(.system(size: 15))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.top, 10)
                            } else  {
                                Text("No Data available")
                            }
                        } .padding(.all, 10)
                }
                })
                
            })
        
    }
    
    private func getBorderDesign(geometry: GeometryProxy) -> AnyView {
        switch configuration.dividerDesign {
        case .ZigZag:
            return AnyView(PTZigZagPathDraw(geometry: geometry))
        case .Straight:
            return AnyView(
                Divider()
                    .background(Color.white)
                    .frame(height: 20)
            )
        }
    }
}


@available(iOS 13.0, *)
struct RowView<Content: View>: View {
    let content: Content

    var body: some View {
        content
    }
    init(@ViewBuilder content: () -> Content ) {
        self.content = content()
    }
}
