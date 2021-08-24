//
//  ContentView.swift
//  webPaa1410
//
//  Created by macintosh on 6/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
                    
            VStack (spacing: 0) {
                newHeader()
                    .frame(height:200)
                
                newBody()
                    .frame(height:700)
            }
        }.navigationViewStyle(StackNavigationViewStyle())

    }
}

func newButton(){
    
    print("hello world")
}

struct newHeader: View {
    @State private var toggle = false

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
                        HStack{
                            NavigationLink(" ", destination: EmptyView())
//                            Toggle(isOn: $toggle) {
//                                Text("Hello World")
//                            }
                            Button("Hidden mode"){
                                
                                newButton()
                                
                            }


                        }
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

struct newBody: View {
    var body: some View {
    
        VStack{
            HStack {
                cell(header: "Bracelet", text: "36", color: Color.orange)
                cell(header: "RM", text: "74", color: Color.red)
                cell(header: "Rings", text: "74", color: Color.yellow)
                cell(header: "Pendant", text: "51", color: Color.gray)
            }
            
            HStack {
                cell(header: "Pings", text: "7", color: Color.green)
                cell(header: "Necklace", text: "18", color: Color.blue)
                cell(header: "Earning", text: "12", color: Color.white)
                cell(header: "Watches", text: "12", color: Color.black)
            }
        }
        
        
    }
}

func cell(header: String, text: String, color: Color) -> some View {
        HStack {

            VStack(alignment: .leading) {
                NavigationLink("Show", destination: EmptyView())

                Text(header)
                    .font(.title)
                    .fontWeight(.bold)
                Text(text)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
//        .frame(maxWidth: .infinity)
        .frame(height:200)
        .padding(20)
        .background(color)
        .cornerRadius(10)
        .padding(10)
}


struct RedView: View {
    var body: some View {
        ZStack {
            Color(red: 12 / 255, green: 53 / 255, blue: 62 / 255)

            Text("Subview A")
        }
    }
}
struct YellowView: View {
    var body: some View {
        ZStack {
            Color.yellow
            Text("Subview B")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
