//
//  ProductItem.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/27/21.
//

import SwiftUI

struct ProductItem: View {
    
    let imagePlaceholder: String

    let idPlaceholder: String
    let descriptionPlaceholder: String
    let companyPlaceholder: String
    let companystylePlaceholder: String
    let stylePlaceholder: String
    let categoryPlaceholder: String
    let notesPlaceholder: String
    let pricePlaceholder: String
    let priceoptPlaceholder: String
    let hiddenPlaceholder: Bool
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
            
        NavigationLink(destination: ProductDetails(imagePlaceholder: imagePlaceholder, idPlaceholder: idPlaceholder, descriptionPlaceholder: descriptionPlaceholder, companyPlaceholder: companyPlaceholder, companystylePlaceholder: companystylePlaceholder, stylePlaceholder: stylePlaceholder, categoryPlaceholder: categoryPlaceholder, notesPlaceholder: notesPlaceholder, pricePlaceholder: pricePlaceholder, priceoptPlaceholder: priceoptPlaceholder, hiddenPlaceholder: hiddenPlaceholder, loader: loader), label:{
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
                                                        
                            Text(descriptionPlaceholder.uppercased()).bold()
                            Text(companyPlaceholder.lowercased())
                            Text("companystyle").font(.caption)

                        
                        }.padding()
                    }
                }
            })
    
        

    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(imagePlaceholder: "foodPlaceholder", idPlaceholder: "", descriptionPlaceholder: "", companyPlaceholder: "", companystylePlaceholder: "", stylePlaceholder: "", categoryPlaceholder: "", notesPlaceholder: "", pricePlaceholder: "", priceoptPlaceholder: "", hiddenPlaceholder: false, loader: { closure in
                        closure(UIImage(named: "rings"))})
    }
}
