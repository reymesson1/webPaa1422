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
                    .frame(height:300)
                
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

                    HomeView()
                        .frame(height:700)
                    
                }

            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
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
