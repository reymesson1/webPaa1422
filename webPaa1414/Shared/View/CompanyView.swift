//
//  CompanyView.swift
//  webPaa1414
//
//  Created by MacBook Pro on 9/7/21.
//

import SwiftUI

struct CompanyView: View {
    @EnvironmentObject var viewModel : ViewModel

    var body: some View {

        VStack{
            
            HStack{
                Spacer()
                Button("Add Company"){
                    print("Add modal")
                }
            }.padding()
            
            ForEach(viewModel.companiyItems, id: \.id){ item in
                
                VStack(alignment: .leading){
                    
                    HStack(alignment: .bottom){
                        
                        Image(systemName: "circle")
                        
                        VStack(alignment: .leading, spacing: 2){
                         
                            Text("Value: \(item.description) ").bold()
                            Text("Value: \(item.notes) ").font(.caption)

                        }.padding(.top, 5)

                    }
//                    }.padding([.leading, .trailing], 10)
                    
                }
                
            }
            
            Spacer()
            
        }


    }
}

struct CompanyView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyView()
    }
}
