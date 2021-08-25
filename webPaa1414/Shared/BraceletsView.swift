//
//  BraceletsView.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct BraceletsView: View {

//    @EnvironmentObject var viewModel: ViewModel
//    var id: String
//    let viewModel: RestaurantDetailViewModel
    
//    init(restaurant: PostModel) {
//      self.viewModel = RestaurantDetailViewModel(restaurant: restaurant)
//    }
    
    
    let viewModel: RestaurantDetailViewModel

    init(restaurant: PostModel) {
      self.viewModel = RestaurantDetailViewModel(restaurant: restaurant)
    }



    var body: some View {
        VStack{
            List{

                ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in

//                ForEach(viewModel.items, id: \.id){ item in
//                    ForEach(0 ..< 5, id: \.self){ item in

//                    Text("test")
//                        cell(header: "Bracelet", text: "36", color: Color.orange)
                    VStack {
                        cellBracelets(header: imageVM.placeholder, text: "36", color: Color.orange)
//                        cell(header: "Rings", text: "74", color: Color.red)
//                        cell(header: "Necklace", text: "51", color: Color.gray)
                    }
                }
            }
        }

    }
}

func cellBracelets(header: String, text: String, color: Color) -> some View {
        HStack {

            HStack {
                NavigationLink("Show", destination: ProductDetails(id:header))

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


struct BraceletsView_Previews: PreviewProvider {
    static var previews: some View {
//        BraceletsView(id: "0")
        BraceletsView(restaurant: PostModel(id: "", description: "", company: "", images: ["",""]))

    }
}
