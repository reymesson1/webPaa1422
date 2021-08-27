//
//  ProductZoom.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct ProductZoom: View {
    let imagePlaceholder: String
    let loader: (@escaping (UIImage?) -> Void) -> Void

    @State private var image: UIImage?

    var imageToShow: UIImage {
      if let loadedImage = image {
        return loadedImage
      } else {
        return UIImage(named: imagePlaceholder)!
      }
    }

    var body: some View {
        
        Image(uiImage: imageToShow)
            .resizable()

    }
}

struct ProductZoom_Previews: PreviewProvider {
    static var previews: some View {
        ProductZoom(imagePlaceholder: "foodPlaceholder"){ closure in
            closure(UIImage(named: "restaurant1"))}
    }
}
