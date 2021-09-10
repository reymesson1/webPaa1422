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


    var body: some View {
        
        HStack{
            
            VStack{
                
                HStack{
                    Text("Field by: ")
                    Spacer()
                }
//                TextField("Company ", text: $title)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(6)
//                    .padding(.bottom)
                
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
                        
//                        newButton()
                        print("test \(titleInput)")
                        let parameters: [String: Any] = ["company": company, "companystyle": companystyle, "style": style, "price": price, "priceopt": priceopt]
                        viewModelFilter.createPostsFilter(parameters: parameters)
//                        viewModel.createPosts(parameters: parameters)

                    }
                }
                Spacer()
                Button(""){
                    
                    newButton()
                }
                
            }.padding()
            .frame(width:400)
            Spacer()
            VStack{
                
                VStack{
                    List{
                        
                        ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
                            
                            ProductItem(imagePlaceholder: imageVM.placeholder, idPlaceholder: imageVM.idData,descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.notesData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceData, hiddenPlaceholder: imageVM.hiddenData ,loader: imageVM.loader )

                        }

                }
                
            }
            
        }
        
        
        
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
