//
//  ProductDetails.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import SwiftUI

struct ProductDetails: View {
    let imagePlaceholder: String
    

    @State var idPlaceholder: String
    let descriptionPlaceholder: String
    let companyPlaceholder: String
    let companystylePlaceholder: String
    let stylePlaceholder: String
    let categoryPlaceholder: String
    let notesPlaceholder: String
    let pricePlaceholder: String
    let priceoptPlaceholder: String
    let hiddenPlaceholder: Bool
    let imagesPlaceholder: [String]
    @State var favoritePlaceholder: Bool
    let loader: (@escaping (UIImage?) -> Void) -> Void
    @State private var image: UIImage?

    @State private var sendEmail: Bool = false
    
    @State private var selectedSegmentIndex: Int = 0
    
    var imageToShow: UIImage {
      if let loadedImage = image {
        return loadedImage
      } else {
        return UIImage(named: imagePlaceholder)!
      }
    }
   

    var body: some View {
        
        VStack{

            NavigationLink(destination: ProductZoom(imagePlaceholder: imagePlaceholder, loader: loader), label:{

                Image(uiImage: imageToShow)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                  .onAppear {
                    loader {
                        self.image = $0
                    }
                  }
            })

            Text(descriptionPlaceholder)
            Picker("", selection: $selectedSegmentIndex){
                
                Text("Details").tag(0)
                Text("More Images").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if selectedSegmentIndex == 0 {
                
                List{
                    
                    HStack{
                        Text("Style Number: ")
                        
                        
                        Text(descriptionPlaceholder)
                            .font(.title)
                        
                    }.padding(.leading, 20)


                    
                    HStack{
                        Text("Price: ")
                        
                        Text("$" + pricePlaceholder)
                            .font(.title)
                    }.padding(.leading, 20)
                    
                    HStack{
                        Text("Price Opt: ")
                        
                        Text("$" + priceoptPlaceholder)
                            .font(.title)
                    }.padding(.leading, 20)
                    
                    if hiddenPlaceholder {

                    
                        HStack{
                            Text("Company:    ")
                            
                            Text(companyPlaceholder)
                                .font(.title)
                        }.padding(.leading, 20)
                        
                        HStack{
                            Text("Company Style: ")
                            
                            Text(companystylePlaceholder)
                                .font(.title)
                        }.padding(.leading, 20)
                        
                        HStack{
                            Text("Style:          ")
                            
                            Text(stylePlaceholder)
                                .font(.title)
                        }.padding(.leading, 20)
                    }
                    
                    HStack{
                        Text("Category:           ")
                        
                        Text(categoryPlaceholder)
                            .font(.title)
                    }.padding(.leading, 20)
                    
                    HStack{
                        Text("Note:               ")
                        
                        Text(notesPlaceholder)
                            .font(.title)
                    }.padding(.leading, 20)






                    
                }  .listStyle(SidebarListStyle())


                
            }else{
                
                List(0 ..< imagesPlaceholder.count, id: \.self ){ index in

                    let item = ItemModel(id: "0", description: descriptionPlaceholder, company: companyPlaceholder, companystyle: companystylePlaceholder, style: stylePlaceholder, category: categoryPlaceholder, notes: notesPlaceholder, price: pricePlaceholder, priceopt: priceoptPlaceholder, hidden: hiddenPlaceholder, favorite: favoritePlaceholder, image: imagesPlaceholder[index], images: imagesPlaceholder)
                                
                    let restaurant = PostModel(id: "0", category: "", items: [item])
                                
                    ProductDetailsListView(restaurant: restaurant, category: "Details List")
                    
                    
                }

                
                
            }
            
            
            
            
            
            
            
            
            
            
            

            
        }
        
    }
}


struct FavoriteHeaderView: View {

    @EnvironmentObject var viewModel : ViewModel
    @Binding var idPlaceholder : String
    @Binding var favoritePlaceholder : Bool
    
    init(idPlacerholder: Binding<String>,favoritePlaceholder: Binding<Bool>){
        
        self._idPlaceholder = idPlacerholder
        self._favoritePlaceholder = favoritePlaceholder
        
    }
    
    var body: some View {

        Button(action:{
            print("press")
            favoritePlaceholder.toggle()
            let parameters: [String: Any] = ["productId": idPlaceholder, "favorite": favoritePlaceholder]
            viewModel.createPostsFavorite(parameters: parameters) //                    viewModel.fetchPosts()

        }, label:{
            Image(systemName: "star.fill")
                .foregroundColor(favoritePlaceholder ? .red : .gray)
                .font(.system(size: 36))
            Text("              ")

        })
        
    }
    
}

struct ProductDetailsListView: View {

    let viewModel: RestaurantDetailViewModel
    let category: String

    init(restaurant: PostModel, category: String) {
      self.viewModel = RestaurantDetailViewModel(restaurant: restaurant)
      self.category = category
    }
    
    var body: some View {
        
        VStack{
            
            ForEach(viewModel.getImageItems(), id: \.self.id) { imageVM in
                
//                  ProductItemList(imagePlaceholder: imageVM.placeholder, loader: imageVM.loader)
                
                ProductItem(imagePlaceholder: imageVM.placeholder, idPlaceholder: imageVM.idData, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder: imageVM.companystyleData, stylePlaceholder: imageVM.styleData, categoryPlaceholder: imageVM.categoryData, notesPlaceholder: imageVM.categoryData, pricePlaceholder: imageVM.priceData, priceoptPlaceholder: imageVM.priceoptData, hiddenPlaceholder: imageVM.hiddenData, favoritePlaceholder: imageVM.favoriteData, imagesPlaceholder: imageVM.imagesData, loader: imageVM.loader)


//                ProductItem(imagePlaceholder: imageVM.placeholder, idPlaceholder: imageVM.idData, descriptionPlaceholder: imageVM.descriptionData, companyPlaceholder: imageVM.companyData, companystylePlaceholder:
                
            }
            
            
        }
    }
    
}
        

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(imagePlaceholder: "foodPlaceholder", idPlaceholder: "",descriptionPlaceholder: "", companyPlaceholder: "", companystylePlaceholder: "", stylePlaceholder: "", categoryPlaceholder: "",notesPlaceholder: "", pricePlaceholder: "", priceoptPlaceholder: "", hiddenPlaceholder: false, imagesPlaceholder: [""], favoritePlaceholder: false){ closure in
            closure(UIImage(named: "restaurant1"))}
    }
}
