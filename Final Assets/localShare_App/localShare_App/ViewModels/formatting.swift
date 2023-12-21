//
//  formatting.swift
//  localShare_App
//
//  Created by ahmed casual on 12/19/23.
//

import Foundation
import SwiftUI

  

struct formatDate
{
    var  dateFormatter = DateFormatter()
    
    
    
    func formatDateIntoDate(givenDate:String) -> Date
    {
       dateFormatter.dateFormat = "dd/MM/yy"
    return dateFormatter.date(from: givenDate)!
        
    }
    
    func formatDateIntoText(date: Date) -> String
    {
        dateFormatter.dateFormat = "dd/MM/yy"
         return dateFormatter.string(from: date)
    }
}

struct buttonCheckboxStyle: ToggleStyle
{
    func makeBody(configuration: Configuration) -> some View{
        Button(action:{
            
            configuration.isOn.toggle()
            
        }
               , label:{
            
            HStack{
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(Color("textColor"))
                configuration.label
            }
        }
        
        
        )
        }
        
        
        
    }

struct closeButton: View{
    @Environment(\.dismiss) private var dismiss
    
    var body: some View
    
    
    {
        
        VStack{
            
            Button{ dismiss.callAsFunction() }
            
        label:{
            
            Image(systemName: "xmark.circle")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding(.all, 5)
                .background(Color.red.opacity(1.0))
                .clipShape(Circle())
                .accessibility(label: Text("Close"))
                .accessibility(hint: Text("Tap to close the screen"))
                .accessibility(addTraits: .isButton)
                .accessibility(removeTraits: .isImage)
        }
        }
            
        
    }
    
}
    
    



