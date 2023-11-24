//
//  UserData.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/25.
//

import Foundation

struct User : Codable{
    let result : Bool
    let message : String 
    let data : [GetUserData]
}

struct GetUserData : Codable{
    let name : String
    let age : Int
    let part : String
    let imgURL : String?
}
