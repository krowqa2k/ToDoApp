//
//  ItemModel.swift
//  ToDo App
//
//  Created by admin on 21/06/2024.
//

import Foundation

//Immutable Struct

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    let date: Date
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, date: Date) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.date = date
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, date: date)
    }
    
}
