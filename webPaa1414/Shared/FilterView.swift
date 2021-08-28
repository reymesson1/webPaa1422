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
                    TextField("Company Style number", text: $companystyle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                    Text("")
                    TextField("Style ", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                    Text("")
                    HStack{
                        TextField("Price ", text: $text)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                        Text(" to ")
                        Spacer()
                        TextField("Price Opt ", text: $text)
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
                        let parameters: [String: Any] = ["company": company, "companystyle": companystyle]
                        viewModelFilter.createPosts(parameters: parameters)

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
                            
                            ProductItem(imagePlaceholder: imageVM.placeholder, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, loader: imageVM.loader )

                        }

                        
//                        ForEach(viewModel.items, id: \.id){ item in
        //                    ForEach(0 ..< 5, id: \.self){ item in

//                            cell(header: item.category, text: "36", color: Color.orange)

//                        }
                    }

//                    HStack {
//                        cell(header: "Bracelet", text: "36", color: Color.orange)
//                        cell(header: "Rings", text: "74", color: Color.red)
//                        cell(header: "Necklace", text: "51", color: Color.gray)
//                    }
//
//                    HStack {
//                        cell(header: "Pendant", text: "7", color: Color.green)
//                        cell(header: "Anklet", text: "18", color: Color.blue)
//                        cell(header: "Belly Chain", text: "12", color: Color.purple)
//                    }
                }
                
            }
            
        }
        
        
        
    }
}

func cell(header: String, text: String, color: Color) -> some View {
        HStack {

            VStack(alignment: .leading) {
//                NavigationLink("Show", destination: ProductDetails(id: header))

                Text(header)
                    .font(.title)
                    .fontWeight(.bold)
                Text(text)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
//        .frame(maxWidth: .infinity)
        .frame(height:200)
        .padding(20)
        .background(color)
        .cornerRadius(10)
        .padding(10)
}


func newButton(){
    
    print("test")
        
    
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
