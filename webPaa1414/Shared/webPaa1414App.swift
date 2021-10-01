//
//  webPaa1414App.swift
//  Shared
//
//  Created by MacBook Pro on 7/18/21.
//

import SwiftUI

@main
struct webPaa1414App: App {
    
    let storedName = UserDefaults.standard.object(forKey: "name")
    var nameLabel: String = ""
    
    init(){
        
        if let newName = storedName as? String {
            nameLabel = "\(newName)"
                    
        }
        
    }
    
    var body: some Scene {
    
        WindowGroup {
            if nameLabel == "" {
                
                LoginView().environmentObject(ViewModel())
            }else{
                
                ContentView().environmentObject(ViewModel())
            }
//            LoginView().environmentObject(ViewModel())
//            ContentView().environmentObject(ViewModel())

        }
    }
}
