//
//  ViewModel.swift
//  webPaa1414
//
//  Created by MacBook Pro on 7/18/21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var items = [PostModel]()
    
    let prefixUrl = "http://10.0.0.221:8085"
    
    init() {
        fetchPosts()
    }
    
    func createPosts(parameters: [String:Any]){
        
        guard let url = URL(string: "\(prefixUrl)/createpost") else{
            
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: url){ (data,res, error) in
            
            if error != nil{
                
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do{
                
                if let data = data{
                    
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        
                        print(data)
                    }
                }else{
                    print("No data")
                }
                
            }catch let JsonError{
                print("fetch json error", JsonError.localizedDescription)
            }
            
        }.resume()
        
    }
    
    func fetchPosts(){
        
        guard let url = URL(string: "\(prefixUrl)/posts") else{
            
            print("Not found url")
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data,res, error) in
            
            if error != nil{
                
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do{
                
                if let data = data{
                    
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                        
                    }
                }else{
                    print("No data")
                }
                
            }catch let JsonError{
                print("fetch json error", JsonError.localizedDescription)
            }
            
        }.resume()
        
    }
    
    
    
    
}
