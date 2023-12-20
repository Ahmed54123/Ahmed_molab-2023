//
//  FridgeView.swift
//  localShare_App
//
//  Created by ahmed casual on 12/18/23.
//

import SwiftUI

    //TESTING/SAMPLE VARIABLES

var sampleItem = Item(itemName: "Chobani Yogurt", vegan: false, nonFat: false, halal: true, glutenFree: true, expireDate: formatDate().formatDateIntoDate(givenDate: ("09/02/2026")))


//Shelves
var sampleProteinShelf = FridgeShelf(name: "Protein", shelfItems: [], thumbnailImage: "Meat")
var sampleCarbsShelf = FridgeShelf(name: "Carbs", shelfItems: [], thumbnailImage: "Bread")
var sampleDairyShelf = FridgeShelf(name: "Dairy", shelfItems: [sampleItem,sampleItem], thumbnailImage: "Dairy")
var sampleFruitsShelf = FridgeShelf(name: "Fruits and Vegetables", shelfItems: [], thumbnailImage: "VegetablesFruits")




var sampleFridge = Fridge(plantBased: true, nonFoodItems: false, petFood: false, cookedFood: false, shelvesInFridge: [sampleProteinShelf, sampleCarbsShelf, sampleDairyShelf, sampleFruitsShelf])

struct FridgeView: View {
    var body: some View {
        
        
        ZStack{
            
            NavigationStack{
                
                
                    
                
                List{
                    
                    
                    
                    ForEach(sampleFridge.shelvesInFridge){ shelf in
                        
                        Section(shelf.name)
                        {
                            
                            shelfRow(shelf: shelf, shelfImageName: shelf.thumbnailImage)
                                .listRowBackground(Color("textColor"))
                            
                            ForEach(shelf.shelfItems){ item in
                                
                                itemRow(item: item)
                                    .listRowBackground(Color("bkColor"))
                                
                                
                                
                            }
                            
                        }
                        
                        
                        
                        
                        
                    }
                }
                .listStyle(.grouped)
                .navigationTitle("Shelves")
                
                    
                .scrollContentBackground(.hidden)
                .background(Color("bkColor"))
                
            }
            
        }
        
        
        
    }
        
}

struct FridgeView_Previews: PreviewProvider {
    static var previews: some View {
        FridgeView()
    }
}
