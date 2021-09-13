//
//  FifthView.swift
//  RestApp
//
//  Created by MacBook Pro on 8/23/21.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var viewModelFilter : ViewModel
    let viewModel: RestaurantDetailViewModel
    let category: String

    init(restaurant: PostModel, category: String) {
      self.viewModel = RestaurantDetailViewModel(restaurant: restaurant)
      self.category = category
    }
    
    var body: some View {
        
        GeometryReader{ geometry in
        
            VStack{
                HStack{
                    Text(category).bold()
                        .font(.system(size: 26))
                    Spacer()
                }
                .padding(.bottom)

                ScrollView{

                    LazyVGrid(columns: [GridItem(.fixed(geometry.size.width/2.0)), GridItem(.fixed(geometry.size.width/2.0))]){
                                                        
                        ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
                            
                            ProductItem(imagePlaceholder: imageVM.placeholder, idPlaceholder: imageVM.idData,descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.notesData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceData, hiddenPlaceholder: imageVM.hiddenData, favoritePlaceholder: imageVM.favoriteData ,loader: imageVM.loader )
                            

                        }
                    }
                    
                    
                }
            }
        }
    }
}
