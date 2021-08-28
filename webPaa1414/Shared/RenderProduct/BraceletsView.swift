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

    var body: some View {
        VStack{
            HStack{
                Text(category).bold()
                    .font(.system(size: 26))
                Spacer()
            }

            List{

                ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
                    
                    ProductItem(imagePlaceholder: imageVM.placeholder, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData,  loader: imageVM.loader )

                }
            }
        }

    }
}

struct BraceletsView_Previews: PreviewProvider {
    static var previews: some View {
        BraceletsView(restaurant: PostModel(id: "", category: "", items: [ItemModel(id: "", description: "", company: "" , image: "")]), category: "")

    }
}
