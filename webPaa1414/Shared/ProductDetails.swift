//
//  ProductDetails.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct ProductDetails: View {
    let imagePlaceholder: String
    

    @State var idPlaceholder: String
    let descriptionPlaceholder: String
    let companyPlaceholder: String
    let companystylePlaceholder: String
    let stylePlaceholder: String
    let categoryPlaceholder: String
    let notesPlaceholder: String
    let pricePlaceholder: String
    let priceoptPlaceholder: String
    let hiddenPlaceholder: Bool
    let imagesPlaceholder: [String]
    @State var favoritePlaceholder: Bool
    let loader: (@escaping (UIImage?) -> Void) -> Void
    @State private var image: UIImage?
    @State private var image2: UIImage?

    
    @State private var sendEmail: Bool = false
    
    @State private var selectedSegmentIndex: Int = 0

    var imageToShow: UIImage {
      if let loadedImage = image {
        return loadedImage
      } else {
        return UIImage(named: imagePlaceholder)!
      }
    }

    var body: some View {
        
        VStack{

            NavigationLink(destination: ProductZoom(imagePlaceholder: imagePlaceholder, loader: loader), label:{

                Image(uiImage: imageToShow)
                    .resizable()
                  .onAppear {
                    loader {
                        self.image = $0
                    }
                  }
            })
            
            Picker("", selection: $selectedSegmentIndex){
                
                Text("Details").tag(0)
                Text("More Images").tag(1)
                
            }.pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if selectedSegmentIndex == 0 {
                
                
                List(0 ..< imagesPlaceholder.count, id: \.self){ index in


                    Text(imagesPlaceholder[index])
                    
                    
                    
                }
                
                
            }else{
                
                Text("More Images")
                
                List(0 ..< imagesPlaceholder.count, id: \.self){ index in
                    
                    let item = ItemModel(id: idPlaceholder, description: descriptionPlaceholder, company: companyPlaceholder, companystyle: companystylePlaceholder, style: stylePlaceholder, category: categoryPlaceholder, notes: notesPlaceholder, price: pricePlaceholder, priceopt: priceoptPlaceholder, hidden: hiddenPlaceholder, favorite: favoritePlaceholder, image: imagePlaceholder, images: imagesPlaceholder)
                    
                    let restaurant = PostModel(id: "0", category: "ProductDetails", items: [item])
//
                    let viewModel = RestaurantDetailViewModel(restaurant: restaurant)
                    
                    let imageVM = viewModel.getImageItems()[0]
                    
//                    ProductItem(imagePlaceholder: imageVM.placeholder, idPlaceholder: imageVM.idData, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.notesData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceoptData, hiddenPlaceholder: imageVM.hiddenData, favoritePlaceholder: imageVM.favoriteData, imagesPlaceholder: imageVM.imageData2, loader: imageVM.loader )

                


                    
                    
//
////
//                    ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
////
//
//                        ProductItem(imagePlaceholder: imagesPlaceholder[index], idPlaceholder: imageVM.idData, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.notesData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceoptData, hiddenPlaceholder: imageVM.hiddenData, favoritePlaceholder: imageVM.favoriteData, imagesPlaceholder: imageVM.imageData2, loader: imageVM.loader )
//
//                    }



                    Text(imagesPlaceholder[index] + "   ")
                    Text(imagePlaceholder + "   ")

                    ProductItem(imagePlaceholder: imagePlaceholder, idPlaceholder: idPlaceholder, descriptionPlaceholder: descriptionPlaceholder, companyPlaceholder: companyPlaceholder, companystylePlaceholder: companystylePlaceholder, stylePlaceholder: stylePlaceholder, categoryPlaceholder: categoryPlaceholder, notesPlaceholder: notesPlaceholder, pricePlaceholder: pricePlaceholder, priceoptPlaceholder: priceoptPlaceholder, hiddenPlaceholder: hiddenPlaceholder, favoritePlaceholder: favoritePlaceholder, imagesPlaceholder: imagesPlaceholder, loader: loader)

                    
                    
                    
                }

                
                
            }
            
            
            
        }
        
    }
}


struct FavoriteHeaderView: View {

    @EnvironmentObject var viewModel : ViewModel
    @Binding var idPlaceholder : String
    @Binding var favoritePlaceholder : Bool
    
    init(idPlacerholder: Binding<String>,favoritePlaceholder: Binding<Bool>){
        
        self._idPlaceholder = idPlacerholder
        self._favoritePlaceholder = favoritePlaceholder
        
    }
    
    var body: some View {

        Button(action:{
            print("press")
            favoritePlaceholder.toggle()
            let parameters: [String: Any] = ["productId": idPlaceholder, "favorite": favoritePlaceholder]
            viewModel.createPostsFavorite(parameters: parameters) //                    viewModel.fetchPosts()

        }, label:{
            Image(systemName: "star.fill")
                .foregroundColor(favoritePlaceholder ? .red : .gray)
                .font(.system(size: 36))
            Text("              ")

        })
        
    }
    
}
        

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(imagePlaceholder: "foodPlaceholder", idPlaceholder: "",descriptionPlaceholder: "", companyPlaceholder: "", companystylePlaceholder: "", stylePlaceholder: "", categoryPlaceholder: "",notesPlaceholder: "", pricePlaceholder: "", priceoptPlaceholder: "", hiddenPlaceholder: false, imagesPlaceholder: [""] , favoritePlaceholder: false){ closure in
            closure(UIImage(named: "restaurant1"))}
    }
}
