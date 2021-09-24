//
//  Models.swift
//  webPaa1414
//
//  Created by MacBook Pro on 7/18/21.
//

import Foundation
import SwiftUI

struct DataModel : Decodable {
    
    let error:  Bool
    let message: String
    let data : [PostModel]
    
}

struct PostModel : Decodable {
    let id: String
    let category: String
    let items: [ItemModel]

}

struct ItemModel : Decodable {
    let id: String
    let description: String
    let company: String
    let companystyle: String
    let style: String
    let category: String
    let notes: String
    let price: String
    let priceopt: String
    let hidden: Bool
    let favorite: Bool
    let image: String

}

struct Company : Decodable {
    let id: String
    let description: String
    let notes: String
}

struct DataModelCompany : Decodable {
    
    let error:  Bool
    let message: String
    let data : [Company]
    
}

struct Style : Decodable {
    let id: String
    let description: String
    let notes: String
}

struct DataModelStyle : Decodable {
    
    let error:  Bool
    let message: String
    let data : [Style]
    
}

struct Login : Decodable {
    let token: String
}

struct DataModelLogin : Decodable {

    let error:  Bool
    let message: String
    let data : [Login]
}
