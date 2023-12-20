//
//  ItemModel.swift
//  localShare_App
//
//  Created by ahmed casual on 12/12/23.
//

import Foundation
import SwiftUI

struct Item: Identifiable, Codable, Hashable {
    
    
    var id = UUID()
    var itemName: String
    var vegan: Bool
    var nonFat: Bool
    var halal: Bool
    var glutenFree: Bool

    var expireDate: Date

    
}




class FridgeShelf: Codable, Identifiable, ObservableObject
{
    var id = UUID()
    var name: String
    var shelfItems: [Item]
    let thumbnailImage: String
    
    func addItemToShelf(newItem: Item)
    {
        shelfItems.append(newItem)
    }
    
    init(id: UUID = UUID(), name: String, shelfItems: [Item], thumbnailImage: String) {
        self.id = id
        self.name = name
        self.shelfItems = shelfItems
        self.thumbnailImage = thumbnailImage
    }
    
    
}
    


    
struct Fridge: Identifiable, Codable {
    var id = UUID()
    
    
    
    let plantBased: Bool
    let nonFoodItems: Bool
    let petFood: Bool
    let cookedFood: Bool
    
    var shelvesInFridge: [FridgeShelf]
    
    
    




    
}



    

    
    
    
    

//references

