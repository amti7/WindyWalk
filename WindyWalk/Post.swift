//
//  Post.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 05/03/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import ObjectMapper

class Post: Mappable {
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        id <- map["id"]
        body <- map["body"]
    }
    
    var title: String?
    var id: Int?
    var body: String?
    


    
}
