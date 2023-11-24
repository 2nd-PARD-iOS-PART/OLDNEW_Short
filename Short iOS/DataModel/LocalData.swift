//
//  LocalData.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/25.
//

import UIKit
import RealmSwift

class LocalLoginCheckData : Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var idvalue = ""
    @Persisted var password: String?
    @Persisted var checkLogin : Bool 
}

