//
//  DataController.swift
//  localShare_App
//
//  Created by ahmed casual on 12/12/23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "ItemBP")
    init()
    {
        container.loadPersistentStores{desc, error in if let error = error {
            print("Failed to load the data \(error.localizedDescription)")
            
            
        }
            
        }
        
        
    }
    
    func save(context: NSManagedObjectContext)
    {
        do {
            try context.save()
            print("Data saved! ENJOY!")
            
        }
        
        catch
        {
            print("We could not save the data...")
            
        }
    }
    func addItem(itemName: String, vegan: Bool,  nonFat: Bool,  halal: Bool,  glutenFree: Bool,  expireDate: Date, context: NSManagedObjectContext)
        {
            let item = ItemBP(context: context)
            item.id = UUID()
            item.itemName = itemName
            item.vegan = vegan
            item.nonFat = nonFat
            item.halal = halal
            item.glutenFree = glutenFree
            item.expireDate = expireDate
            
            save(context: context)
            
        }
        
    
}
