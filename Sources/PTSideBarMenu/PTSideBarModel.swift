//
//  PTSideBarModel.swift
//  SideMenu
//
//  Created by Pankaj Talreja on 11/02/21.
//

import SwiftUI

@available(iOS 13.0, *)
public struct PTSideBarModel {
    let title: String?
    let imageName: String?
    let image: Image?
    let downloadImageURL: URL?
    private init(withtitle title: String?, imageName: String?, image: Image?, downloadImageURL: URL?) {
        self.title = title
        self.imageName = imageName
        self.image = image
        self.downloadImageURL = downloadImageURL
    }
    
    
    public init(withTitle title: String) {
        self.init(withtitle: title, imageName: nil, image: nil, downloadImageURL: nil)
    }
    
    public init(imageName: String?) {
        self.init(withtitle: nil, imageName: imageName, image: nil, downloadImageURL: nil)
    }
    public init(withtitle title: String, imageName: String) {
        self.init(withtitle: title, imageName: imageName, image: nil, downloadImageURL: nil)
    }
    public init(withtitle title: String, image: Image?) {
        self.init(withtitle: title, imageName: nil, image: image, downloadImageURL: nil)
    }
    
    public init(withtitle title: String?, downloadImageURL: URL?) {
        self.init(withtitle: title, imageName: nil, image: nil, downloadImageURL: downloadImageURL)
    }
    
}
