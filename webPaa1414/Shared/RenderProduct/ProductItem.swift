//
//  ProductItem.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/27/21.
//

import SwiftUI

struct ProductItem: View {
    
    let imagePlaceholder: String
    
    let descriptionPlaceholder: String
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
            
            NavigationLink(destination: ProductDetails(imagePlaceholder: imagePlaceholder, loader: loader), label:{
                VStack{
                    HStack{
                        
                        Image(uiImage: imageToShow)
                            .resizable()
                            .scaledToFill()
                            .animation(.default)
                            .frame(width: 100, height: 100)
                          .onAppear {
                            loader {
                                self.image = $0
                            }
                          }
                        
                        Text("   ")
                        
                        VStack(alignment: .leading, spacing: 5){
                                                        
                            Text(descriptionPlaceholder).bold()
                            Text("company")
                            Text("companystyle").font(.caption)

                        
                        }.padding()
                    }
                }
            })
    
        

    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(imagePlaceholder: "foodPlaceholder", descriptionPlaceholder: "", loader: { closure in
                        closure(UIImage(named: "rings"))})
    }
}
