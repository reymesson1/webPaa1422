//
//  SendEmailView.swift
//  webPaa1414
//
//  Created by MacBook Pro on 9/10/21.
//

import SwiftUI

struct SendEmailView: View {
    
    let idPlaceholder: String
    @State var text = ""
    @State var firstname = ""
    @State var lastname = ""
    @State var email = ""
    @State var price = ""
    @State var priceopt = ""
    @EnvironmentObject var viewModel : ViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var body: some View {
        
        VStack{
            HStack{

                Text("Send an email").bold()
                    .font(.system(size: 30))
                
                Spacer()
            }
            
            VStack{

                Group{
                    TextField("First Name ", text: $firstname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                    Text("")
                    TextField("Last Name ", text: $lastname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                    Text("")
                    TextField("Email ", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("")
                    Text("")
                }
                Text("")
                Text("")
                Text("")
                Text("")
                
                HStack{
                    Spacer()
                    Button("Send"){

                        
                        print("press")
                        let parameters: [String: Any] = ["id":idPlaceholder, "firstname": firstname, "lastname": lastname, "email": email]
                        viewModel.createPostsSendEmail(parameters: parameters)
                        presentationMode.wrappedValue.dismiss()


                    }
                }

            }.padding(20)
        }
        
    }
}

struct SendEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SendEmailView(idPlaceholder: "")
    }
}
