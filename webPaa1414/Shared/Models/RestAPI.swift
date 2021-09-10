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
    @Published var filterItems = [PostModel]()
    @Published var companiyItems = [Company]()
    @Published var styleItems = [Style]()
    @Published var isHidden = true
    
    @Published var search: String? = nil
    @Published var searchInput: String = ""{
        didSet{
            setSearch(term: searchInput)
        }
    }

//    let prefixUrl = "http://10.0.0.221:8085"
    let prefixUrl = "http://143.198.171.44:8085"


    init() {
        fetchPosts()
        fetchPostsCompanies()
        fetchPostsStyles()
    }
    
    func setSearch(term: String){
        let toSearch = term.trimmingCharacters(in: .whitespaces)
        search = toSearch == "" ? nil : toSearch
    }
    
    var filteredList: [Style]{
        
        if let searchText = search{
            return styleItems.filter({ $0.description.contains(searchText) })
        }else{
            return styleItems
        }
    }
    
    var filteredListCompany: [Company]{
        
        if let searchText = search{
            return companiyItems.filter({ $0.description.contains(searchText) })
        }else{
            return companiyItems
        }
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
        
        URLSession.shared.dataTask(with: request){ (data,res, error) in
            
            if error != nil{
                
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do{
                
                if let data = data{
                    
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        
                        print(result)
                        self.items = result.data
                        self.filterItems = result.data

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
                        self.filterItems = result.data
                        self.isHidden = result.data[0].items[0].hidden
                    }
                }else{
                    print("No data")
                }
                
            }catch let JsonError{
                print("fetch json error", JsonError.localizedDescription)
            }
            
        }.resume()
        
    }
    
    func createPostsFilter(parameters: [String:Any]){
        
        guard let url = URL(string: "\(prefixUrl)/postsfilter") else{
            
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ (data,res, error) in
            
            if error != nil{
                
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do{
                
                if let data = data{
                    
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        
                        print(result)
                        self.items = result.data
                        self.filterItems = result.data

                    }
                }else{
                    print("No data")
                }
                
            }catch let JsonError{
                print("fetch json error", JsonError.localizedDescription)
            }
            
        }.resume()
        
    }
    
    func createPostsHidden(parameters: [String:Any]){
        
        guard let url = URL(string: "\(prefixUrl)/onhiddenmode") else{
            
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ (data,res, error) in
            
            if error != nil{
                
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do{
                
                if let data = data{
                    
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        
                        print(result)

                    }
                }else{
                    print("No data")
                }
                
            }catch let JsonError{
                print("fetch json error", JsonError.localizedDescription)
            }
            
        }.resume()
        
    }
    
    func fetchPostsCompanies(){
        
        guard let url = URL(string: "\(prefixUrl)/postscompanies") else{
            
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
                    
                    let result = try JSONDecoder().decode(DataModelCompany.self, from: data)
                    DispatchQueue.main.async {
                        self.companiyItems = result.data
                        print(result)
                    }
                }else{
                    print("No data")
                }
                
            }catch let JsonError{
                print("fetch json error", JsonError.localizedDescription)
            }
            
        }.resume()
        
    }
    
    func fetchPostsStyles(){
        
        guard let url = URL(string: "\(prefixUrl)/postsstyles") else{
            
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
                    
                    let result = try JSONDecoder().decode(DataModelStyle.self, from: data)
                    DispatchQueue.main.async {
                        self.styleItems = result.data
                        print(result)
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
