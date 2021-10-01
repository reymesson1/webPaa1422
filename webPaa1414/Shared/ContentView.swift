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
                    
                    HStack{

                        Spacer()
                        ContentToggleView(favoritePlaceholder: $viewModel.isHidden)

                    }
                    

                    
                    HStack{
                        ForEach(viewModel.items, id: \.id){ item in

                            if(item.id == "8"){

                                NavigationLink("Filter", destination: FilterView(restaurant: item, category: "Filter")).padding()
                                Text("|")

                            
                            }
                            if(item.id == "9"){

                                NavigationLink("Favorite", destination: FavoriteView(restaurant: item, category: "Favorite")).padding()
                                Spacer()
                            
                            }
                        }
                        Spacer()
                        Text(" ")
                        Spacer()
                        Button(action: {
                            print("Value has been updated")
                            viewModel.fetchPosts()
                        }) {
                            Image("refresh")
                                .resizable()
                                .scaledToFill()
//                                .animation(.default)
                                .frame(width: 40, height: 40)
                        }
                    }
                    
                    VStack{

                        newBody()
                            .frame(height:600)

                    }

                    
                }

            }.edgesIgnoringSafeArea(.all)
            
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

                                Image("folder-bracelets")
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

                                Image("folder-rm")
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

                                Image("folder-rings")
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

                                Image("folder-pendant")
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

                                Image("folder-pins")
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

                                Image("folder-necklace")
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

                                Image("folder-earrings")
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

                                Image("folder-watches")
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
    
    @State var favoritePlaceholder : Bool = false

    var body: some View {

        ZStack{
//            Color(red: 12 / 255, green: 53 / 255, blue: 62 / 255)
            Image("background")
                .resizable()
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
                        NavigationLink("Style", destination: StyleView())
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
                        NavigationLink("Company", destination: CompanyView())
                        Spacer()
                    }
                }
                Group{
                    VStack{
                        Spacer()
                        NavigationLink(" ", destination: EmptyView())
                        NavigationLink("", destination: EmptyView())
//                        NavigationLink("Logout", destination: LoginView())
                        NavigationLink(destination: LoginView(), isActive: $favoritePlaceholder, label: {

                            Button(action:{
                                print("press")
                                self.favoritePlaceholder = true
                                UserDefaults.standard.removeObject(forKey: "name")
                            }, label:{
                                Text("Logout")
                            })
                            
                        }).padding(.bottom, 120)

                        NavigationLink("", destination: EmptyView())

                    }
                }
            }
        }

    }
    
    

    
}

struct ContentToggleView: View {

    @EnvironmentObject var viewModel : ViewModel
    @Binding var favoritePlaceholder : Bool

    init(favoritePlaceholder: Binding<Bool>){

        self._favoritePlaceholder = favoritePlaceholder
    }

    var body: some View {

        Button(action:{
            favoritePlaceholder.toggle()
            let parameters: [String: Any] = ["productId": "", "favorite": favoritePlaceholder]
            viewModel.createPostsHidden(parameters: parameters) 

        }, label:{
            
            if(favoritePlaceholder){
                Image(systemName: "eye.slash.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 36))
            }else{
                Image(systemName: "eye.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 36))
            }
        })

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
