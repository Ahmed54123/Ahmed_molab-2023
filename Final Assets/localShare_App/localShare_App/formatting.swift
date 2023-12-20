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
    
    



