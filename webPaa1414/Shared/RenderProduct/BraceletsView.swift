//
//  BraceletsView.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct BraceletsView: View {

    let viewModel: RestaurantDetailViewModel
    let category: String

    init(restaurant: PostModel, category: String) {
      self.viewModel = RestaurantDetailViewModel(restaurant: restaurant)
      self.category = category
    }
    
    var items : [GridItem]{
        
        Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    }

    var body: some View {
        VStack{
            HStack{
                Text(category).bold()
                    .font(.system(size: 26))
                Spacer()
            }

            ScrollView(.vertical, showsIndicators: false){

                LazyVGrid(columns: items, spacing: 10){

                    ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
                        

                        ProductItem(imagePlaceholder: imageVM.placeholder, idPlaceholder: imageVM.idData, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.notesData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceoptData, hiddenPlaceholder: imageVM.hiddenData, favoritePlaceholder: imageVM.favoriteData, imagesPlaceholder: imageVM.imagesData, loader: imageVM.loader )

                    }
                }
//            }
            }.padding(.vertical)
            
        }

    }
}

struct BraceletsView_Previews: PreviewProvider {
    static var previews: some View {
        BraceletsView(restaurant: PostModel(id: "", category: "", items: [ItemModel(id: "", description: "", company: "", companystyle: "", style: "", category: "", notes: "", price: "", priceopt: "", hidden: false, favorite: false, image: "", images: [String()] )]), category: "")

    }
}
