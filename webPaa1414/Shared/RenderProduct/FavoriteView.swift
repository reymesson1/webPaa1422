//
//  FifthView.swift
//  RestApp
//
//  Created by MacBook Pro on 8/23/21.
//

import SwiftUI

struct FavoriteView: View {
    @State var text = ""
    @State var company = ""
    @State var companystyle = ""
    @State var style = ""
    @State var price = ""
    @State var priceopt = ""
    @State private var titleInput: String = ""
    @EnvironmentObject var viewModelFilter : ViewModel
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
            .padding(.bottom)
            ScrollView(.vertical, showsIndicators: false){

                LazyVGrid(columns: items, spacing: 10){

                    ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
                        

                        ProductItem(imagePlaceholder: imageVM.placeholder, idPlaceholder: imageVM.idData, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.notesData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceoptData, hiddenPlaceholder: imageVM.hiddenData, favoritePlaceholder: imageVM.favoriteData, imagesPlaceholder: imageVM.imageData2, loader: imageVM.loader )

                    }
                }
//            }
            }.padding(.vertical)
        }
    }
}
