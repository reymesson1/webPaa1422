//
//  webPaa1414App.swift
//  Shared
//
//  Created by MacBook Pro on 7/18/21.
//

import SwiftUI

@main
struct webPaa1414App: App {
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(ViewModel())
//            ContentView().environmentObject(ViewModel())

        }
    }
}
