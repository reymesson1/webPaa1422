//
//  CompanyModalView.swift
//  webPaa1414 (iOS)
//
//  Created by MacBook Pro on 9/3/21.
//

import SwiftUI

struct CompanyModalView: View {
    var body: some View {
    
        VStack{

            SearchBar()
            
            ForEach(1...5, id: \.self) { value in
                
                Text("Value \(value)")
                
                
            }
            Spacer()

        }
        Spacer()
        
    }
}

struct SearchBar: View{
    
    @EnvironmentObject var viewModel : ViewModel

    var body: some View {

        Spacer()
        HStack{
            TextField("Company", text: $viewModel.searchInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())

        }

        
    }
    
}

struct CompanyModalView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyModalView()
    }
}
