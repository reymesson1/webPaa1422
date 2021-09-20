//
//  LoginView.swift
//  webPaa1414
//
//  Created by MacBook Pro on 9/20/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var text = ""
    @State var firstname = ""
    @State var lastname = ""
    @State var email = ""
    @State var price = ""
    @State var priceopt = ""
    @EnvironmentObject var viewModel : ViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
    
        ZStack{
            
            Image("background")
            
                
        
                VStack{
                    
                    Image("login")
                    
                

                    Group{
                        Text("")
                        Text("")
                        TextField("First Name ", text: $firstname)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(10)
                        Text("")
                        Text("")
                        TextField("Last Name ", text: $lastname)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(10)

                        Text("")
                        Text("")
                        Button(action:{
                            print("press")
                        }, label:{
                            Image("submit")
                        })

                    }

                

                }.padding()
                .font(.title)
                .frame(width: 400, height: 400, alignment: .center)
                
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
