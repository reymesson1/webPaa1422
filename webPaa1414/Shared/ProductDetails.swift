//
//  ProductDetails.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct ProductDetails: View {
    let imagePlaceholder: String
    
    
    let descriptionPlaceholder: String
    let companyPlaceholder: String
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
                    HStack{

                        Text("Style Number: ").bold()
                            .font(.system(size: 26))
                        Text(descriptionPlaceholder)
                            .font(.system(size: 26))

                    }
                    HStack{

                        Text("Company name: ").bold()
                            .font(.system(size: 26))
                        Text(companyPlaceholder)
                            .font(.system(size: 26))

                    }

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
        ProductDetails(imagePlaceholder: "foodPlaceholder", descriptionPlaceholder: "", companyPlaceholder: ""){ closure in
            closure(UIImage(named: "restaurant1"))}
    }
}
