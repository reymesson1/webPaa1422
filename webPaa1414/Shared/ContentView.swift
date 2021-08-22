//
//  ContentView.swift
//  Shared
//
//  Created by MacBook Pro on 7/18/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        HomeView()
        
        
    }
}

struct HomeView: View {
    @EnvironmentObject var viewModel: ViewModel
//    @State private var loader: (@escaping (UIImage?) -> Void) -> Void
    @State private var image: UIImage?

    var imageToShow: UIImage {
      if let loadedImage = image {
        return loadedImage
      } else {
        return UIImage(named: "foodPlaceholder")!
      }
    }

    var body: some View {
        
        

        NavigationView{
            
            List{
                
                ForEach(viewModel.items, id: \.name){ item in
//                    ForEach(0 ..< 5, id: \.self){ item in

                    Text("Hello, world!")
                        .padding()

                }
            }
            
            .navigationBarTitle("Posts")
            .navigationBarItems(trailing: plusButton)
            
            
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
