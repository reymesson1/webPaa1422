//
// LoginView.swift
// webPaa1414
//
// Created by MacBook Pro on 9/20/21.
//

import SwiftUI

struct LoginView: View {

@State var text = ""
@State var username = ""
@State var password = ""
@State var email = ""
@State var price = ""
@State var priceopt = ""
@EnvironmentObject var viewModel : ViewModel
@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
@State var isLinkActive = false
@State var isUsernameValid = false

var body: some View {

    NavigationView{

    ZStack{

        Image("background")

            VStack{
                Image("login")

                Group{
                    Text("")
                    Text("")
                    TextField("User Name ", text: $username)
                        .padding()
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(5)
                        .padding(.bottom,20)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .cornerRadius(10)
                    Text("")
                    Text("")
                    SecureField("Password ", text: $password)
                        .padding()
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(5)
                        .padding(.bottom,20)

                    Text("")
                    Text("")
                    
                    if(isUsernameValid){

                        Text("Username or Password Invalid")
                            .foregroundColor(Color.red)
                    }
                    
                    
                    NavigationLink(destination: ContentView(), isActive: $isLinkActive){
                        Button(action:{
                            let parameters: [String: Any] = ["username": username, "password": password]
                            viewModel.createPostsLogin(parameters: parameters)

//                            print(viewModel.token.count)
//                            print(viewModel.token)
                            
                            
                            if(viewModel.token.count > 0 ){
                                self.isLinkActive = true
                                self.isUsernameValid = false

                            }else{
                                self.isUsernameValid = true
                            }


                            
                            }, label:{
                                Text("Submit")
                                 .frame(minWidth: 0, maxWidth: .infinity)
                                 .font(.system(size: 25))
                                 .padding()
                                 .foregroundColor(.white)
                                
                        })
                        .background(Color.green)
                        .cornerRadius(25)
                        
                    }
                }
            }.padding()
            .font(.title)
            .frame(width: 400, height: 400, alignment: .center)

    }

    }.navigationViewStyle(StackNavigationViewStyle())

}
}

struct LoginView_Previews: PreviewProvider {
static var previews: some View {
LoginView()
}
}
