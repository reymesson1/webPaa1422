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
    let image: String

}

