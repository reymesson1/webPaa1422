//
//  FifthView.swift
//  RestApp
//
//  Created by MacBook Pro on 8/23/21.
//

import SwiftUI

struct FilterView: View {
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
        
        HStack{
            
            
            VStack{
                
                HStack{
                    Text(category).bold()
                        .font(.system(size: 26))
                    Spacer()
                }
                .padding(.bottom)
                
                HStack{
                    Text("Field by: ")
                        .padding(20)
                    Spacer()
                }                
                Group{
                    TextField("Company ", text: $company)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                    Text("")
                    TextField("Company Style number ", text: $companystyle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                    Text("")
                    TextField("Style ", text: $style)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                    Text("")
                    HStack{
                        TextField("Price From ", text: $price)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                        Text(" to ")
                        Spacer()
                        TextField("Price To ", text: $priceopt)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                Text("")
                Text("")
                Text("")
                Text("")
                HStack{
                    Spacer()
                    Button("Search"){
                        
                        print("test \(titleInput)")
                        let parameters: [String: Any] = ["company": company, "companystyle": companystyle, "style": style, "price": price, "priceopt": priceopt]
                        viewModelFilter.createPostsFilter(parameters: parameters)
                    }
                }
                Spacer()
                Button(""){
                    
                    newButton()
                }
                
            }.padding()
            .frame(width:300)
            VStack{
                
                VStack{
                    ScrollView(.vertical, showsIndicators: false){

                        LazyVGrid(columns: items, spacing: 10){

                            ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
                                

                                    ProductItem(imagePlaceholder: imageVM.placeholder, idPlaceholder: imageVM.idData, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.notesData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceoptData, hiddenPlaceholder: imageVM.hiddenData, favoritePlaceholder: imageVM.favoriteData, loader: imageVM.loader )

                            }
                        }
        //            }
                    }.padding(.vertical)
                
                }
            
            }
            .frame(width:700)

    }
}
}

func newButton(){
    
    print("test")
        
    
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
