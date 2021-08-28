//
//  BraceletsView.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct BraceletsView: View {

    let viewModel: RestaurantDetailViewModel

    init(restaurant: PostModel) {
      self.viewModel = RestaurantDetailViewModel(restaurant: restaurant)
    }

    var body: some View {
        VStack{
            HStack{
                Text("Bracelets").bold()
                    .font(.system(size: 26))
                Spacer()
            }

            List{

                ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
                    
                    ProductItem(imagePlaceholder: imageVM.placeholder, descriptionPlaceholder: imageVM.descriptionData, loader: imageVM.loader )

                }
            }
        }

    }
}

struct BraceletsView_Previews: PreviewProvider {
    static var previews: some View {
        BraceletsView(restaurant: PostModel(id: "", category: "", items: [ItemModel(id: "", description: "", image: "")]))

    }
}
