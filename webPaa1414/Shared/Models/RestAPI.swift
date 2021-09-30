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
    @Published var token = ""
    @Published var isLogged = false
    @Published var isNotLogged = false
    @Published var isLoggedTXT = ""

//    let prefixUrl = "http://10.0.0.221:8085"
    let prefixUrl = "http://143.198.171.44:8085"
//    let prefixUrl = "http://192.168.43.81:8085"


    init() {
        fetchPosts()
        fetchPostsCompanies()
        fetchPostsStyles()
        viewDidLoad()
    }
    
    func viewDidLoad() {
            
            let storedName = UserDefaults.standard.object(forKey: "name")
//            let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
            
            // Casting - as?  vs  as!  force casting
        
            
            if let newName = storedName as? String {
                isLoggedTXT = "\(newName)"
                
            }
        
            print(isLoggedTXT)
        
//            if storedName as! String == "" {
//
//                UserDefaults.standard.set("false", forKey: "name")
//
//            }
        
        
//            if let newBirthday = storedBirthday as? String {
//                birthdayLabel.text = "Birthday: \(newBirthday)"
//            }
            
    }
    
    func saveButton(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
//            let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting - as?  vs  as!  force casting
    
        
        if let newName = storedName as? String {
            isLoggedTXT = "\(newName)"
            
        }
    
        print( "from token" +  isLoggedTXT)

            
//            UserDefaults.standard.set("true", forKey: "name")
//            UserDefaults.standard.set(birthdayText.text!, forKey: "birthday")
            
            
//            nameLabel.text = "Name: \(nameText.text!)"
//            birthdayLabel.text = "Birthday: \(birthdayText.text!)"
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
    
    func createPostsSendEmail(parameters: [String:Any]){
        
        guard let url = URL(string: "\(prefixUrl)/sendemail") else{
            
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
    
    func createPostsFavorite(parameters: [String:Any]){
        
        guard let url = URL(string: "\(prefixUrl)/setfavorite") else{
            
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
    
    func createPostsHiddenNew(parameters: [String:Any]){
        
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
    
    
    func createPostsLogin(parameters: [String:Any]){

        guard let url = URL(string: "\(prefixUrl)/loginipad") else{

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
                    // let result = try JSONDecoder().decode(DataModel.self, from: data)
                    let result = try JSONDecoder().decode(DataModelLogin.self, from: data)
                    DispatchQueue.main.async {

                        self.token = result.data[0].token
                    // self.defaults.set("token", forKey: result.data[0].token)
                     print(result.data[0].token)
                        UserDefaults.standard.set(result.data[0].token, forKey: "name")

                        if(result.data[0].token.count>0){
                            self.isLogged=true
                        }
                    }
                }else{
                    print("No data")
                }

            }catch let JsonError{
                print("fetch json error", JsonError.localizedDescription)
                self.isNotLogged=true
            }

        }.resume()
    
    }

    
    
    
}
