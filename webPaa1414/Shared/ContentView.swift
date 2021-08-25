//
//  ContentView.swift
//  Shared
//
//  Created by MacBook Pro on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var currentState: Bool = true
    @EnvironmentObject var viewModel: ViewModel

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
                        ForEach(viewModel.items, id: \.id){ item in

                            newBodyContent(restaurant: item)
                                .frame(height:600)
                        }

                    }

                    
                    
                                        

//                    HomeView()
//                        .frame(height:600)
                    
                }

            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct newBodyContent: View {
//    @EnvironmentObject var viewModel : ViewModel
    let viewModel: RestaurantDetailViewModel

    init(restaurant: PostModel) {
      self.viewModel = RestaurantDetailViewModel(restaurant: restaurant)
    }

    var body: some View {
        
    
        VStack{
            HStack {
                cellBraceletContent(header: "Bracelet", items: viewModel, text: "36", color: Color.orange)
                cellRing(header: "Rings", text: "74", color: Color.red)
                cellNecklace(header: "Necklace", text: "51", color: Color.gray)
            }
            
            HStack {
                cellPendant(header: "Pendant", text: "7", color: Color.green)
                cellCrown(header: "Crown", text: "18", color: Color.blue)
                cellGemStone(header: "GemStone", text: "12", color: Color.purple)
            }
            
//            HStack {
//                cellPendant(header: "Pendant", text: "7", color: Color.green)
//                cellCrown(header: "Crown", text: "18", color: Color.blue)
//                cellGemStone(header: "GemStone", text: "12", color: Color.purple)
//            }

        }
        
        
    }
}

func cellBraceletContent(header: String, items: RestaurantDetailViewModel ,text: String, color: Color) -> some View {
    
    


        ZStack {
            
            Image("bracelets")
                .resizable()

            VStack(alignment: .leading) {
//                NavigationLink("Bracelet", destination: BraceletsView( restaurant:   ))
//                NavigationLink("Bracelet", destination: BraceletsView( restaurant: PostModel(id: "1629658342738", description: "rings-new-water-point", company: "Company1", image: "rings-new-water-point-Style1-0.jpg", images: ["rings-new-water-point-Style1-0.jpg","rings-new-water-point-Style1-0.jpg"])  ))

//                NavigationLink("Bracelet", destination: CategoryView(restaurant: PostModel(id: "", description: "", company: "", image: "", images: ["",""])))
                
                ForEach(items.getImageItems(), id: \.id){ item in

                    NavigationLink("Bracelet", destination: CategoryView(restaurant: PostModel(id: "", description: "", company: "", image: "", images: ["",""]), imagePlaceholder: item.placeholder,loader: item.loader) )
                                        .font(.title)
                                        .foregroundColor(Color(.white))
                }
            }
            Spacer()
        }
        .frame(height:200)
        .padding(20)
        .background(color)
        .cornerRadius(10)
        .padding(10)
}

func cellRing(header: String, text: String, color: Color) -> some View {
        ZStack {
            
            Image("rings")
                .resizable()

            VStack(alignment: .leading) {
                NavigationLink("Ring", destination: EmptyView())
                    .font(.title)
                    .foregroundColor(Color(.white))

//                Text(header)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                Text(text)
//                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .frame(height:200)
        .padding(20)
        .background(color)
        .cornerRadius(10)
        .padding(10)
}

func cellNecklace(header: String, text: String, color: Color) -> some View {
        ZStack {
            
            Image("necklaces")
                .resizable()

            VStack(alignment: .leading) {
                NavigationLink("Neck lace", destination: EmptyView())
                    .font(.title)
                    .foregroundColor(Color(.white))

//                Text(header)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                Text(text)
//                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .frame(height:200)
        .padding(20)
        .background(color)
        .cornerRadius(10)
        .padding(10)
}

func cellPendant(header: String, text: String, color: Color) -> some View {
        ZStack {
            
            Image("pendant")
                .resizable()

            VStack(alignment: .leading) {
                NavigationLink("Pendant", destination: EmptyView())
                    .font(.title)
                    .foregroundColor(Color(.white))

//                Text(header)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                Text(text)
//                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .frame(height:200)
        .padding(20)
        .background(color)
        .cornerRadius(10)
        .padding(10)
}

func cellCrown(header: String, text: String, color: Color) -> some View {
        ZStack {
            
            Image("crowns")
                .resizable()

            VStack(alignment: .leading) {
                NavigationLink("Crown", destination: EmptyView())
                    .font(.title)
                    .foregroundColor(Color(.white))

//                Text(header)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                Text(text)
//                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .frame(height:200)
        .padding(20)
        .background(color)
        .cornerRadius(10)
        .padding(10)
}

func cellGemStone(header: String, text: String, color: Color) -> some View {
        ZStack {
            
            Image("gemstones")
                .resizable()

            VStack(alignment: .leading) {
                NavigationLink("Gem Stone", destination: EmptyView())
                    .font(.title)
                    .foregroundColor(Color(.white))

//                Text(header)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                Text(text)
//                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .frame(height:200)
        .padding(20)
        .background(color)
        .cornerRadius(10)
        .padding(10)
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
