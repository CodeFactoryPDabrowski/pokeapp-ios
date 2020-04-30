//
//  UrlImage.swift
//  PokeAppIos
//
//  Created by Przemyslaw Dabrowski on 20/03/2020.
//  Copyright © 2020 Przemyslaw Dabrowski. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct UrlImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    
    init(url: String) {
        print("Photo to load: \(url)")
        self.imageLoader.load(url: url)
    }
    
    var body: some View {
       Image(uiImage: imageLoader.dataIsValid ? imageFromData(imageLoader.data!) : UIImage())
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width:72, height:72)
    }
    
    private func imageFromData(_ data:Data) -> UIImage {
        UIImage(data: data) ?? UIImage()
    }
}
