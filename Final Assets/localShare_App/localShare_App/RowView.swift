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
            Button{
                
            } label: {
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
            
            Button{
                
                
            }
        label: {Image(systemName: "plus.app").scaleEffect(x: 3, y:3)}                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(30)

            
        }
    }
    
    
}



struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        shelfRow(shelf: sampleProteinShelf, shelfImageName: sampleProteinShelf.thumbnailImage)
        itemRow(item: sampleItem)
    }
}
