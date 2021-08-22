//
//  Models.swift
//  webPaa1414
//
//  Created by MacBook Pro on 7/18/21.
//

import Foundation
import SwiftUI

struct DataModel : Decodable {
    
    let error:  String
    let message: String
    let data : [PostModel]
    
}

struct PostModel : Decodable {
    let id: Int
    let title: String
    let post: String
}
