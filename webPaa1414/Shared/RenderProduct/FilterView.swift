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
    @State private var titleInput: String = ""
    @EnvironmentObject var viewModelFilter : ViewModel
    let viewModel: RestaurantDetailViewModel
    let category: String
    
    @State private var isExpanded = false
    @State private var selectedNum = 1

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
                Group{

                    VStack(alignment: .leading, spacing: 15){
                                                
                        DisclosureGroup("\(selectedNum)", isExpanded: $isExpanded){
                            
                            VStack{
                                
                                ForEach(1...5, id: \.self){ num in
                                    
                                    Text("\(num)")
                                        .font(.title3)
                                        .padding(.all)
                                        .onTapGesture {
                                            self.selectedNum = num
                                            withAnimation{

                                                self.isExpanded.toggle()

                                            }
                                        }
                                    
                                }
                            }
                        }.accentColor(.white)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .background(Color.blue)
                        .cornerRadius(8)
                        
                        Spacer()
                        
                        
                    }.padding(.all)
                    
//                    TextField("Company ", text: $company)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    Text("")
//                    Text("")
//                    TextField("Company Style number", text: $companystyle)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    Text("")
//                    Text("")
//                    TextField("Style ", text: $text)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    Text("")
//                    Text("")
//                    HStack{
//                        TextField("Price ", text: $text)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        Spacer()
//                        Text(" to ")
//                        Spacer()
//                        TextField("Price Opt ", text: $text)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                    }
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
                        let parameters: [String: Any] = ["company": company, "companystyle": companystyle]
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
                            
                            ProductItem(imagePlaceholder: imageVM.placeholder, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.notesData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceData, hiddenPlaceholder: imageVM.hiddenData ,loader: imageVM.loader )

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
