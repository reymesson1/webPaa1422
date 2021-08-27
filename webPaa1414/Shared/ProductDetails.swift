//
//  ProductDetails.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct ProductDetails: View {
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
        
        VStack{
            VStack{
                
                NavigationLink(destination: ProductZoom(imagePlaceholder: imagePlaceholder, loader: loader), label:{

                Image(uiImage: imageToShow)
                    .resizable()
                    .scaledToFill()
                    .animation(.default)
                    .frame(width: 500, height: 500, alignment: .center)
                  .onAppear {
                    loader {
                        self.image = $0
                    }
                  }
                })
                Spacer()
            }
            VStack{
                HStack{
                    Text("Style Number: ")
                    Text("Company name: ")
                    Text("Company Style")
                }
                HStack{
                    Text("Style: ")
                    Text("Category: ")
                    Text("Notes: ")

                }
                HStack{
                    Text("Price: ")
                    Text("Price opt: ")

                }

            }
            Spacer()
        }
        
        
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(imagePlaceholder: "foodPlaceholder"){ closure in
            closure(UIImage(named: "restaurant1"))}
    }
}
