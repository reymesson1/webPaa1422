//
//  ProductDetails.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct ProductDetails: View {
    @EnvironmentObject var viewModel: ViewModel
    var id: String
    var body: some View {
        
        VStack{
            HStack{
                Text("\(id)")
                .font(.title)
                .fontWeight(.bold)
                Spacer()
            }
            VStack{
                NavigationLink("Image", destination: ProductZoom(id:id))
            }
            VStack{
                HStack{
                    Text("Style Number: ")
                    Text("Company name: ")
                    Text("Company Style")
                }
                HStack{
                    Text("Style: ")
                    Text("Category: ")
                    Text("Notes: ")

                }
                HStack{
                    Text("Price: ")
                    Text("Price opt: ")

                }

            }
            Spacer()
        }
        
        
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(id: "0")
    }
}
