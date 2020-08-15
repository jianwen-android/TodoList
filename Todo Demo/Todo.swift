//
//  Todo.swift
//  Todo Demo
//
//  Created by YJ Soon on 31/7/20.
//  Copyright © 2020 Tinkercademy. All rights reserved.
//

import Foundation

class Todo {
    
    var name: String
    var done = false
    
    init(name: String) {
        self.name = name
    }
    
    init() {
        self.name = ""
    }
    
}
