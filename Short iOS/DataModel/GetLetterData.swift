//
//  GetLetterData.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/25.
//

import Foundation

struct LetterData : Codable{
    let data : [GetLetterData]
}

struct GetLetterData : Codable{
    let authorId : String
    let roomCode : String
    let title : String
    let sender  : String
    let content  : String
}
