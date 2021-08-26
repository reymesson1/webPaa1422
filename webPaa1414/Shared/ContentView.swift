//
//  ContentView.swift
//  Shared
//
//  Created by MacBook Pro on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var currentState: Bool = true
    @EnvironmentObject var viewModel : ViewModel

    var body: some View {
        
        NavigationView{
                    
            VStack {
                newHeader()
                    .frame(height:270)
                
                VStack{
                    
                    Toggle(isOn: $currentState, label:{
                        Text(currentState ? "On" : "Off")
                            .padding()
                    }).onChange(of: self.currentState, perform: { value in
                        print("Value has changed : \(value)")
                    })

                    
                    HStack{
                        NavigationLink("Filter", destination: FilterView()).padding()
                        Spacer()
                    }
                    
                    VStack{

                        newBody(restaurant: viewModel.items)
                            .frame(height:600)

                    }

                    
                    
                                        

//                    HomeView()
//                        .frame(height:600)
                    
                }

            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct newBody: View {
    @EnvironmentObject var viewModel : ViewModel
    let viewModelImage: RestaurantDetailViewModel

    init(restaurant: PostModel) {
      self.viewModelImage = RestaurantDetailViewModel(restaurant: restaurant)
    }

    var body: some View {
        
    
        VStack{
            HStack {
//                cellBracelet(header: "Bracelet", text: "36", color: Color.orange)
                
//                ForEach(viewModel.items, id: \.id){ item in
                ForEach(viewModelImage.getImageItems(), id: \.id){ item in

                    if(item.id == "1629658342738" ){
                        ZStack {
                            Image("bracelets")
                                .resizable()

                            VStack(alignment: .leading) {
                                  NavigationLink("Bracelet", destination: BraceletsView( restaurant:  item ))
                                    .font(.title)
                                    .foregroundColor(Color(.white))
                            }
                            Spacer()
                        }
                        .frame(height:200)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(10)
                    }else if(item.id == "1629842204399"){
                        
                        ZStack {
                            Image("necklaces")
                                .resizable()

                            VStack(alignment: .leading) {
                                  NavigationLink("Necklaces", destination: BraceletsView( restaurant:  item ))
                                    .font(.title)
                                    .foregroundColor(Color(.white))
                            }
                            Spacer()
                        }
                        .frame(height:200)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(10)
                        
                        
                    }
                    
                    
                }
            }
            
        }
        
        
    }
}



struct newHeader: View {
    var body: some View {

        ZStack{
            Color(red: 12 / 255, green: 53 / 255, blue: 62 / 255)
            HStack{
                Group{
                    VStack{
                        Text("Amsel")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("eCatalog")
                            .foregroundColor(.orange)
                    }
                }
                Spacer()
                Group{
                    VStack{
                        Spacer()
                        NavigationLink(" ", destination: EmptyView())
                        NavigationLink("", destination: EmptyView())
                        NavigationLink(" ", destination: EmptyView())
                        NavigationLink("", destination: EmptyView())
                        NavigationLink("Browse", destination: EmptyView())
                        Spacer()
                    }
                }
                Spacer()
                Group{
                    VStack{
                        Spacer()
                        NavigationLink(" ", destination: EmptyView())
                        NavigationLink("", destination: EmptyView())
                        NavigationLink(" ", destination: EmptyView())
                        NavigationLink("", destination: EmptyView())
                        NavigationLink("Product", destination: EmptyView())
                        Spacer()
                    }
                }
                Spacer()
                Group{
                    VStack{
                        Spacer()
                        NavigationLink(" ", destination: EmptyView())
                        NavigationLink("", destination: EmptyView())
                        NavigationLink(" ", destination: EmptyView())
                        NavigationLink("", destination: EmptyView())
                        NavigationLink("Style", destination: EmptyView())
                        Spacer()
                    }
                }
                Spacer()
                Group{
                    VStack{
                        Spacer()
                        NavigationLink(" ", destination: EmptyView())
                        NavigationLink("", destination: EmptyView())
                        NavigationLink(" ", destination: EmptyView())
                        NavigationLink("", destination: EmptyView())
                        NavigationLink("Company", destination: EmptyView())
                        Spacer()
                    }
                }
                Spacer()
            }
        }

    }
    
    

    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
