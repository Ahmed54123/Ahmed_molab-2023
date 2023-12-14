//
//  ItemModel.swift
//  localShare_App
//
//  Created by ahmed casual on 12/12/23.
//

import Foundation
import SwiftUI

struct Item: Identifiable, Codable {
    
    
    var id = UUID()
    var itemName: String
    var vegan: Bool
    var nonFat: Bool
    var halal: Bool
    var glutenFree: Bool

    var expireDate: Date
    
    
}




class FridgeShelf
{

    let itemCategory: String
    @Published var itemsInShelf : [Item] = []

    init(itemCategory: String, itemsInShelf: [Item]) {
        self.itemCategory = itemCategory
        self.itemsInShelf = itemsInShelf
    }

    {
        didSet
        {
          saveItem()
        }
    }
    let itemsKey: String = "items_shelf"



    func getItems()
    {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Item].self, from: data)
          else{return}

        self.itemsInShelf = savedItems
    }


    func removeItem(indexSet: IndexSet)
    {
        itemsInShelf.remove(atOffsets: indexSet)
    }

    func addItem(itemName: String, vegan: Bool,  nonFat: Bool,  halal: Bool,  glutenFree: Bool,  expireDate: Date)
    {
        let newItem = Item(itemName: itemName, vegan: vegan, nonFat: nonFat, halal: halal, glutenFree: glutenFree, expireDate: expireDate)

        itemsInShelf.append(newItem)
    }

    func saveItem()
    {
        if let encodedData = try? JSONEncoder().encode(itemsInShelf)
        {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }


    }
    


    
struct Fridge: Identifiable {
    var id = UUID()

    
    
    let plantBased: Bool
    let nonFoodItems: Bool
    let petFood: Bool
    let cookedFood: Bool
    
    var Alerts: [Alert]
    
    
    var fridgeShelves: [FridgeShelf] = [FridgeShelf(itemCategory: "Bread AND Carbs"), FridgeShelf(itemCategory: "Proteins"),FridgeShelf(itemCategory: "Dairy AND Alt"), FridgeShelf(itemCategory: "Fruits AND Vegetables")]



    mutating func addShelves(){

        let isPetfood = petFood
        let isCookedFood = cookedFood

        if(isPetfood == true){
            fridgeShelves.append(FridgeShelf(itemCategory: "Pet Food"))
        }

        if(isCookedFood == true){
            fridgeShelves.append(FridgeShelf(itemCategory: "Cooked Food"))
        }



    mutating func addAlert(newAlert: Alert){

        Alerts.append(newAlert)
    }
    
}


struct Alert{
    
    let alertMessage: String
    
    func ShowAlert(){
        
        Text("Alert: " + alertMessage)
        
    }
    
}
    
    
    
    

//references

