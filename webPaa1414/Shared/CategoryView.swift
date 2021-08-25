//
//  ContentView.swift
//  Shared
//
//  Created by MacBook Pro on 7/18/21.
//

import SwiftUI

struct CategoryView: View {
    @State private var currentState: Bool = true
//    @EnvironmentObject var viewModel : ViewModel
    
    let imagePlaceholder: String
//    @EnvironmentObject var viewModel: ViewModel
    let loader: (@escaping (UIImage?) -> Void) -> Void
    @State private var image: UIImage?

    
    
    let viewModel: RestaurantDetailViewModel

    init(restaurant: PostModel, imagePlaceholder: String, loader: (@escaping (UIImage?) -> Void) -> Void ) {
      self.viewModel = RestaurantDetailViewModel(restaurant: restaurant)
      self.imagePlaceholder = imagePlaceholder
      self.loader = { closure in
        closure(UIImage(named: "restaurant1"))}
    }
    
    var imageToShow: UIImage {
      if let loadedImage = image {
        return loadedImage
      } else {
        return UIImage(named: imagePlaceholder)!
      }
    }



    var body: some View {
        
//        NavigationView{
                    
            VStack {

//                newBody()
//                ForEach(viewModel.items, id: \.id){ item in
                ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in

                    ZStack {
                        
                        Image(uiImage: imageToShow)
                            .resizable()

                        VStack(alignment: .leading) {
                            NavigationLink("Bracelet", destination: BraceletsView( restaurant: PostModel(id: "", description: "", company: "", image: "", images: ["",""]), imagePlaceholder: imageVM.placeholder, loader: imageVM.loader ))
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

                    .frame(height:600)
                
                
            }
            
//        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(restaurant: PostModel(id: "", description: "", company: "", image: "", images: ["",""]), imagePlaceholder: "", loader: { closure in
                        closure(UIImage(named: "restaurant1"))})
//        CategoryView()

    }
}
