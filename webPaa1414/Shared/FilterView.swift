//
//  FifthView.swift
//  RestApp
//
//  Created by MacBook Pro on 8/23/21.
//

import SwiftUI

struct FilterView: View {
    @State var text = ""
    @State var title = ""
    @State private var titleInput: String = ""
    @EnvironmentObject var viewModel : ViewModel
    

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
                    TextField("Company ", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                    Text("")
                    TextField("Company Style number", text: $text)
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
                        let parameters: [String: Any] = ["title": title, "post":"test"]
                        viewModel.createPosts(parameters: parameters)

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
                    HStack {
                        cell(header: "Bracelet", text: "36", color: Color.orange)
                        cell(header: "Rings", text: "74", color: Color.red)
                        cell(header: "Necklace", text: "51", color: Color.gray)
                    }
                    
                    HStack {
                        cell(header: "Pendant", text: "7", color: Color.green)
                        cell(header: "Anklet", text: "18", color: Color.blue)
                        cell(header: "Belly Chain", text: "12", color: Color.purple)
                    }
                }
                
            }
            
        }
        
        
        
    }
}

func cell(header: String, text: String, color: Color) -> some View {
        HStack {

            VStack(alignment: .leading) {
                NavigationLink("Show", destination: EmptyView())

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
