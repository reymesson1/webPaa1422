//
//  HomeView.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {

        NavigationView{
            
            List{
                
                ForEach(viewModel.items, id: \.id){ item in
//                    ForEach(0 ..< 5, id: \.self){ item in

                    Text("Hello, world!")
                        .padding()

                }
            }
            
            .navigationBarTitle("Posts")
            .navigationBarItems(trailing: plusButton)
            
//        }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    var plusButton: some View {
        
        Button(action:{
            print("press")
        }, label:{
            Image(systemName: "plus")
        })
    
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
