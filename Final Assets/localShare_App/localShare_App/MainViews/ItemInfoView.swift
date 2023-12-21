//
//  ItemInfoView.swift
//  localShare_App
//
//  Created by ahmed casual on 12/20/23.
//

import SwiftUI

struct ItemInfoView: View {
    
    var itemToInfo: Item
    
        
    var body: some View {
        
        ZStack{
            
            
            
            
            
            HStack
            {
                closeButton()
                    .frame(alignment: .topLeading)
                    .padding(.bottom, 250)
                
                
                VStack
                {
                    
                    Text(itemToInfo.itemName)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("textColor"))
                        .padding(.trailing,20)
                        .frame(alignment: .center)
                    
                    
                    
                    Text(formatDate().formatDateIntoText(date: itemToInfo.expireDate))
                        .padding(.top)
                        .bold()
                        .foregroundColor(Color("textColor"))
                        .frame(alignment: .center)
                        .padding(.trailing, 20)
                    
                    
                    Section{
                        
                        
                        Text(checkIfTrue(element: itemToInfo.nonFat, elementString: "non-fat"))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        
                        Text(checkIfTrue(element: itemToInfo.vegan, elementString: "vegan"))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        Text(checkIfTrue(element: itemToInfo.halal, elementString: "halal"))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        Text(checkIfTrue(element: itemToInfo.glutenFree, elementString: "glutenfree"))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        
                    }
                    .frame(alignment: .center)
                    .padding(.trailing, 20)
                    
                    
                    
                    
                }
            }
        }
        .background(
            Rectangle()
                .inset(by: -30)
                .aspectRatio(1.0, contentMode: .fill)
                .foregroundColor(Color("bkColor"))
                .border(Color("textColor"))
                
                
                
            )
        
        
    }
    
    func checkIfTrue(element: Bool, elementString: String) -> String
    {
    var elementStringReturn = ""
    
        if(element == true){
            elementStringReturn = elementString
        }
        
        return elementStringReturn
    }
}

struct ItemInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        ItemInfoView(itemToInfo: sampleItem)
    }
}
