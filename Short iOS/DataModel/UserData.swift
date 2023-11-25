//
//  UserData.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/25.
//

import Foundation

struct User : Codable{
    let data : [GetUserData]
}

struct GetUserData : Codable{
    let id : Int
    let userid : String
    let username : String

}
