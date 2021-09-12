//
//  ProductDetails.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct ProductDetails: View {
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
    
    @State private var favoriteStar: Bool = false

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
                Spacer()
                Button(action:{
                    print("press")
                    self.favoriteStar.toggle()
                }, label:{
                    Image(systemName: "star.fill")
                        .foregroundColor(favoriteStar ? .red : .gray)
                        .font(.system(size: 36))

                    Text("              ")

                })

                
            }
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

                    Spacer()
                    NavigationLink(destination: SendEmailView(idPlaceholder: idPlaceholder), label:{
                            Text("✉️")
                                .font(.system(size: 36))

                            Text("              ")

                    })
                }
            
            }

            HStack{

                VStack{
                
                    HStack{

                        Text("Style Number: ").bold()
                            .font(.system(size: 26))
                        Text(descriptionPlaceholder)
                            .font(.system(size: 20))

                    }
                    if (hiddenPlaceholder){
                        HStack{

                            Text("Style: ").bold()
                                .font(.system(size: 26))
                            Text(stylePlaceholder)
                                .font(.system(size: 20))

                        }
                    }
                    HStack{

                        Text("Price: ").bold()
                            .font(.system(size: 26))
                        Text(pricePlaceholder)
                            .font(.system(size: 20))

                    }

                    
                    
                }
                
                Text("  ")
                
                VStack{
                
                    if (hiddenPlaceholder){

                        HStack{

                            Text("Company Name: ").bold()
                                .font(.system(size: 26))
                            Text(companyPlaceholder)
                                .font(.system(size: 20))

                        }
                    }
                    HStack{

                        Text("Category: ").bold()
                            .font(.system(size: 26))
                        Text(categoryPlaceholder)
                            .font(.system(size: 20))

                    }
                    HStack{

                        Text("Price opt: ").bold()
                            .font(.system(size: 26))
                        Text(priceoptPlaceholder)
                            .font(.system(size: 20))

                    }

                }
                
                Text("  ")

                
                VStack{
                    
                    if (hiddenPlaceholder){
                
                        HStack{

                            Text("Company Style: ").bold()
                                .font(.system(size: 26))
                            Text(companystylePlaceholder)
                                .font(.system(size: 20))

                        }
                    }
                    if (hiddenPlaceholder){

                        HStack{

                            Text("Notes: ").bold()
                                .font(.system(size: 26))
                            Text(notesPlaceholder)
                                .font(.system(size: 20))

                        }
                    }
                    
                    HStack{

                        Text("          ").bold()
                            .font(.system(size: 26))
                        Text("          ")
                            .font(.system(size: 20))

                    }
                    
                }
                

            }
            Spacer()
        }
        
        
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(imagePlaceholder: "foodPlaceholder", idPlaceholder: "",descriptionPlaceholder: "", companyPlaceholder: "", companystylePlaceholder: "", stylePlaceholder: "", categoryPlaceholder: "",notesPlaceholder: "", pricePlaceholder: "", priceoptPlaceholder: "", hiddenPlaceholder: false){ closure in
            closure(UIImage(named: "restaurant1"))}
    }
}
