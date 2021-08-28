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
                        ForEach(viewModel.items, id: \.id){ item in

                            if(item.id == "8"){

                                NavigationLink("Filter", destination: FilterView(restaurant: item, category: "Filter")).padding()
                                Spacer()
                            
                            }
                        }
                    }
                    
                    VStack{

                        newBody()
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

    var body: some View {
        
    
        VStack{
            HStack {
                
                ForEach(viewModel.items, id: \.id){ item in

                    if(item.id == "0"){

                        ZStack {
                            NavigationLink(destination: BraceletsView( restaurant:  item, category: "Bracelets" ), label:{

                                Image("folder")
                                    .resizable()
                            })
                            .font(.title)
                            .foregroundColor(Color(.white))
                        
                            Text(item.category)
                            .fontWeight(.bold)
                            
                        }
                        .frame(height:200)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(10)
                    }else if(item.id == "1"){
                        
                        ZStack {
                            NavigationLink(destination: BraceletsView( restaurant:  item, category: "RM" ), label:{

                                Image("folder")
                                    .resizable()
                            })
                            .font(.title)
                            .foregroundColor(Color(.white))
                        
                            Text(item.category)
                            .fontWeight(.bold)
                            
                        }
                        .frame(height:200)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(10)
                        
                        
                    }else if(item.id == "2"){
                        
                        ZStack {
                            NavigationLink(destination: BraceletsView( restaurant:  item, category: "Rings" ), label:{

                                Image("folder")
                                    .resizable()
                            })
                            .font(.title)
                            .foregroundColor(Color(.white))
                        
                            Text(item.category)
                            .fontWeight(.bold)
                            
                        }
                        .frame(height:200)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(10)
                        
                        
                    }else if(item.id == "3"){
                        
                        ZStack {
                            NavigationLink(destination: BraceletsView( restaurant:  item, category: "Pendant" ), label:{

                                Image("folder")
                                    .resizable()
                            })
                            .font(.title)
                            .foregroundColor(Color(.white))
                        
                            Text(item.category)
                            .fontWeight(.bold)
                            
                        }
                        .frame(height:200)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(10)
                        
                        
                    }
                        
                    
                }

            } //END HStack #1
            
            HStack {
                
                ForEach(viewModel.items, id: \.id){ item in

                    if(item.id == "4"){

                        ZStack {
                            NavigationLink(destination: BraceletsView( restaurant:  item, category: "Pings" ), label:{

                                Image("folder")
                                    .resizable()
                            })
                            .font(.title)
                            .foregroundColor(Color(.white))
                        
                            Text(item.category)
                            .fontWeight(.bold)
                            
                        }
                        .frame(height:200)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(10)
                    }else if(item.id == "5"){
                        
                        ZStack {
                            NavigationLink(destination: BraceletsView( restaurant:  item, category: "Necklace" ), label:{

                                Image("folder")
                                    .resizable()
                            })
                            .font(.title)
                            .foregroundColor(Color(.white))
                        
                            Text(item.category)
                            .fontWeight(.bold)
                            
                        }
                        .frame(height:200)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(10)
                        
                        
                    }else if(item.id == "6"){
                        
                        ZStack {
                            NavigationLink(destination: BraceletsView( restaurant:  item, category: "Earings" ), label:{

                                Image("folder")
                                    .resizable()
                            })
                            .font(.title)
                            .foregroundColor(Color(.white))
                        
                            Text(item.category)
                            .fontWeight(.bold)
                            
                        }
                        .frame(height:200)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(10)
                        
                        
                    }else if(item.id == "7"){
                        
                        ZStack {
                            NavigationLink(destination: BraceletsView( restaurant:  item, category: "Watches" ), label:{

                                Image("folder")
                                    .resizable()
                            })
                            .font(.title)
                            .foregroundColor(Color(.white))
                        
                            Text(item.category)
                            .fontWeight(.bold)
                            
                        }
                        .frame(height:200)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(10)
                        
                        
                    }
                        
                    
                }

            }// ENDHStack 2
            Spacer()

            
        }//END VStack
        
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
