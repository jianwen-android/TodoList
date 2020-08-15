//
//  Todo.swift
//  Todo Demo
//
//  Created by YJ Soon on 31/7/20.
//  Copyright © 2020 Tinkercademy. All rights reserved.
//

import Foundation

class Todo: Codable {
    
    var name: String
    var done = false
    
    init(name: String) {
        self.name = name
    }
    
    init() {
        self.name = ""
    }
    
    static func getArchivedURL() -> URL {
        
        let plistName = "Todos"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")

    }
    
    static func saveToFile(Todos: [Todo]) {
        let archivedURL = getArchivedURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(Todos)
        try? encodedTodos?.write(to: archivedURL, options: .noFileProtection)
    }
    
    static func loadFromFiles() -> [Todo]? {
        let archivedURL = getArchivedURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedTodoData = try? Data(contentsOf: archivedURL) else { return nil }
        guard let decodedTodos = try? propertyListDecoder.decode(Array<Todo>.self, from: retrievedTodoData) else { return nil }
        return decodedTodos

    }
    
}
