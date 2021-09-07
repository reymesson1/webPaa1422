//
//  CompanyView.swift
//  webPaa1414
//
//  Created by MacBook Pro on 9/7/21.
//

import SwiftUI

struct StyleView: View {
    @EnvironmentObject var viewModel : ViewModel

    var body: some View {

        VStack{

            HStack{

                Text("Style").bold()
                    .font(.system(size: 30))
                
                Spacer()
            }
            HStack{
                Spacer()
                Button("Add Style"){
                    print("Add modal")
                }
            }.padding()
            
            ForEach(viewModel.styleItems, id: \.id){ item in
   
                List{
                    VStack(alignment: .leading){
                        
                        HStack(alignment: .center){
                            
                            Image(systemName: "circle")
                            
                            
                            VStack(alignment: .leading, spacing: 2){
                             
//                                Text("Description: \(item.description) ").bold()
                                HStack{
                                    Text("Description: ").bold()
                                    Text("\(item.description) ")
                                }
                                HStack{
                                    Text("Notes: ").bold()
                                    Text("\(item.notes) ")
                                }

//                                Text("Notes: \(item.notes) ").font(.caption)

                            }.padding(.top, 5)

                        }
    //                    }.padding([.leading, .trailing], 10)
                        
                    }
                }
                
            }
            
            Spacer()
            
        }


    }
}

struct StyleView_Previews: PreviewProvider {
    static var previews: some View {
        StyleView()
    }
}
