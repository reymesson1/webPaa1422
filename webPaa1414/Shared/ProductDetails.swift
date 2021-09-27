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
    @State var favoritePlaceholder: Bool
    let loader: (@escaping (UIImage?) -> Void) -> Void
    @State private var image: UIImage?
    
    @State private var sendEmail: Bool = false
    
    @State private var showSheet: Bool = false
    
    @EnvironmentObject var viewModel : ViewModel


    var imageToShow: UIImage {
      if let loadedImage = image {
        return loadedImage
      } else {
        return UIImage(named: imagePlaceholder)!
      }
    }

    var body: some View {
        
        ZStack{

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
            
            VStack{
                
                HStack{
                    Spacer()
                    FavoriteHeaderView(idPlacerholder: $idPlaceholder, favoritePlaceholder: $favoritePlaceholder)
                }
                
                Spacer()
                Group{
                    HStack(alignment: .top, spacing: 0){
                        VStack(alignment: .leading, spacing: 10){
                            Text("Style Number: ")
                            Text("Style: ")
                            Text("Company: ")
                            Text("Company Style: ")
                            Text("Price: ")
                            Text("Price Opt: ")
                            Text("Notes: ")
                        }.frame(width: 200, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 10){
                            
                            Text("\(descriptionPlaceholder)")
                            Text("\(stylePlaceholder)")
                            Text("\(companyPlaceholder)")
                            Text("\(companystylePlaceholder)")
                            Text("\(pricePlaceholder)")
                            Text("\(priceoptPlaceholder)")
                            Text("\(notesPlaceholder)")
                        }.font(Font.body.weight(.semibold))
                        
                        
                    }.padding()
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 231 / 255, green: 232 / 255, blue: 232 / 255))
                .cornerRadius(15)
                .padding( EdgeInsets(top: 300, leading: 200, bottom: 0, trailing: 200)  )
                
                Spacer()
                Group{
                    HStack(alignment: .bottom, spacing: 0){
                        
                        Button(action:{
                            print("press")
                            let parameters: [String: Any] = ["id": idPlaceholder]
                            viewModel.createPostsProductDetails(parameters: parameters) //                    viewModel.fetchPosts()
//                            FavoriteView(view)
                            self.showSheet = true
                        }, label:{
    
                            Text("Show Image")
                                .font(.system(size: 20))

                                
                        })
                        
                        Spacer()

                        Button(action:{
                            print("press")
                            self.sendEmail = true
                        }, label:{
    
                            Text("Send email")
                                .font(.system(size: 20))

                            Text("✉️")
                                .font(.system(size: 36))
                            
                            Text("              ")

                                
                        })
                        
                    }.padding()
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 231 / 255, green: 232 / 255, blue: 232 / 255))
                .cornerRadius(15)
                .padding(.leading, 200)
                
            }
            
        }.sheet(isPresented: $sendEmail){
            SendEmailView(idPlaceholder: idPlaceholder)
        }
        .sheet(isPresented: $showSheet){
            EmptyView()
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
        

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(imagePlaceholder: "foodPlaceholder", idPlaceholder: "",descriptionPlaceholder: "", companyPlaceholder: "", companystylePlaceholder: "", stylePlaceholder: "", categoryPlaceholder: "",notesPlaceholder: "", pricePlaceholder: "", priceoptPlaceholder: "", hiddenPlaceholder: false, favoritePlaceholder: false){ closure in
            closure(UIImage(named: "restaurant1"))}
    }
}
