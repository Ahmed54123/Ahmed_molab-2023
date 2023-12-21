//
//  itemRow.swift
//  localShare_App
//
//  Created by ahmed casual on 12/18/23.
//

import SwiftUI

struct itemRow: View {
    
    let item: Item
    
    var body: some View {
                
        HStack{
            
            NavigationLink{ ItemInfoView(itemToInfo: item) }
             label: {
                Image(systemName: "info.circle")
                    .foregroundColor(Color("textColor"))
            }
            
            Text(item.itemName)
                .foregroundColor(Color("textColor"))
                
            
            Text(formatDate().formatDateIntoText(date: item.expireDate))
                .bold()
                .foregroundColor(.orange)
                .padding(.leading, 70)
            
        }
        .frame(maxWidth: .infinity ,maxHeight: 50, alignment: .center)
        
        
        .overlay(RoundedRectangle(cornerRadius: 2)
            .stroke(Color("textColor"),lineWidth: 2)
            
                 )
    }
    
    
}

struct shelfRow: View
{
    let shelf: FridgeShelf
    
    let shelfImageName: String
    
    var body: some View
    
    {
        HStack{
            
            
            
            Image(shelf.thumbnailImage)
                .resizable()
                .frame(width: 200, height: 200.0)
            
            NavigationLink{DonationFormView(shelfReference: shelf, thumbnailImage: shelfImageName)}
        label: {Image(systemName: "plus.app").scaleEffect(x: 3, y:3)}                .frame(maxWidth: .infinity, alignment: .trailing)
                   .padding(30)
                   .foregroundColor(Color("bkColor"))

            
        }
    }
    
    
}



struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        shelfRow(shelf: sampleProteinShelf, shelfImageName: sampleProteinShelf.thumbnailImage)
        itemRow(item: sampleItem)
    }
}

//ref: https://ix76y.medium.com/how-to-navigate-between-views-a8b15a4f49ec#:~:text=Navigation%20in%20SwiftUI%20is%20very,want%20to%20navigate%20away%20from.
