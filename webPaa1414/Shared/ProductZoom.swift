//
//  ProductDetails.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct ProductZoom: View {
    let imagePlaceholder: String
//    @EnvironmentObject var viewModel: ViewModel
    let loader: (@escaping (UIImage?) -> Void) -> Void
    @State private var image: UIImage?

//    var id: String
    
    var imageToShow: UIImage {
      if let loadedImage = image {
        return loadedImage
      } else {
        return UIImage(named: imagePlaceholder)!
      }
    }

    var body: some View {
        
        VStack{
            HStack{
                
                Image(uiImage: imageToShow)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .onAppear {
                    loader {
                        self.image = $0
                    }
                  }
//                Text("\(id)")
//                .font(.title)
//                .fontWeight(.bold)
                Spacer()
            }
            VStack{
//                NavigationLink("Image", destination: ProductZoom(id:id))
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

struct ProductZoom_Previews: PreviewProvider {
    static var previews: some View {
        ProductZoom(imagePlaceholder: "foodPlaceholder"){ closure in
            closure(UIImage(named: "restaurant1"))}
    }
}
