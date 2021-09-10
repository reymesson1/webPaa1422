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
    
    let columns = [
    
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {
        VStack{
            HStack{
                Text(category).bold()
                    .font(.system(size: 26))
                Spacer()
            }
            
            ScrollView{
                
                LazyVGrid(columns: columns, spacing: 20){

                    ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
                        
                        ProductItem(imagePlaceholder: imageVM.placeholder, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.notesData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceoptData, hiddenPlaceholder: imageVM.hiddenData, loader: imageVM.loader )

                    }
                }
            }


//            List{
//
//                ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
//
//                    ProductItem(imagePlaceholder: imageVM.placeholder, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.notesData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceoptData, hiddenPlaceholder: imageVM.hiddenData, loader: imageVM.loader )
//
//                }
//            }
        }

    }
}

struct BraceletsView_Previews: PreviewProvider {
    static var previews: some View {
        BraceletsView(restaurant: PostModel(id: "", category: "", items: [ItemModel(id: "", description: "", company: "", companystyle: "", style: "", category: "", notes: "", price: "", priceopt: "", hidden: false, image: "")]), category: "")

    }
}
