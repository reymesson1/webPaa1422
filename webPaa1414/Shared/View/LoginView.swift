//
//  LoginView.swift
//  webPaa1414
//
//  Created by MacBook Pro on 9/23/21.
//

import SwiftUI

let lightGreyColor = Color(red: 239/255, green: 243/255, blue: 244/255)


struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var authenticateDidSuccedd: Bool = true
    @EnvironmentObject var viewModel : ViewModel
    @State var isLinkActive = false
    
    init(){
        
        
    }

    var body: some View {
                    
        NavigationView{
            ZStack{
                
                Image("background")
                    .resizable()
                
                    VStack{
                        HeaderImage()
                        Text(viewModel.isLoggedTXT)
                        UsernameTextField(username: $username)
                        PasswordTextField(password: $password)
                        if viewModel.isNotLogged {
                            Text("Information not correct. Try again.")
                                .offset(y: -10)
                                .foregroundColor(.red)
                        }
//                        if viewModel.isLoggedTXT != "" {
//
//                            ContentToggleValueView(username: $username, password: $password, favoritePlaceholder: $viewModel.isLogged)
//
//                        }else{
////                            NavigationLink(destination: ContentView())
////                            viewModel.
//                            ContentToggleValueView(username: $username, password: $password, favoritePlaceholder: $viewModel.isLogged)
//
//                        }
                        ContentToggleValueView(username: $username, password: $password, favoritePlaceholder: $viewModel.isLogged)
                    }.frame(width: 300)
                    .padding()
            }.edgesIgnoringSafeArea(.all)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct ContentToggleValueView: View {

    @Binding var username: String
    @Binding var password: String
    @EnvironmentObject var viewModel : ViewModel
    @Binding var favoritePlaceholder : Bool

    let isLoggedNew = true
    init(username: Binding<String>, password: Binding<String>,favoritePlaceholder: Binding<Bool>){

        self._username = username
        self._password = password
//        self._favoritePlaceholder
        self._favoritePlaceholder = favoritePlaceholder

    }

    var body: some View {

        NavigationLink(destination: ContentView(), isActive: $favoritePlaceholder, label: {

            Button(action:{
                
    //            viewModel.deleteButton("delete")
                
                let parameters: [String: Any] = ["username": username, "password": password]
                viewModel.createPostsLogin(parameters: parameters)
                if(viewModel.isLogged){
                    
                    print("logged")
                    self.favoritePlaceholder = true
                    viewModel.saveButton("true")                    
                }

            }, label:{
                
                LoginButton()
            })
            
        })

    }

}

struct HeaderImage: View {
    var body: some View{
        
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
        
    }
}

struct LoginButton: View {
    var body: some View{
        
        ZStack{
            
            Image("background")
                .resizable()

            Text("LOGIN")
                .font(.headline)
                .foregroundColor(.white)
                .padding()

        }.frame(width: 220, height: 60)
        .cornerRadius(35)

    }
}

struct UsernameTextField: View {
    
    @Binding var username: String
    
    var body: some View{
        
        TextField("Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5)
            .padding(.bottom, 20)
        
    }
}

struct PasswordTextField: View {
    
    @Binding var password: String
    
    var body: some View{
        
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5)
            .padding(.bottom, 20)
        
        
    }
}
