//
//  ContentView.swift
//  DateTimeDateTime
//
//  Created by ahmed casual on 10/5/23.
//

import SwiftUI

struct ContentView: View {
    @State var currentTime = Date()
    var closedRange = Calendar.current.date(byAdding:.year, value: -1, to: Date())!
    
    func formatDate() -> String{
        let components = Calendar.current.dateComponents([.hour, .minute, .day, .year, .month], from: currentTime)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let day = components.day ?? 0
        let month = components.month ?? 0
        let year = components.year ?? 0
        
        return "\(day)/\(month)/\(year)  \(hour):\(minute)"
        
    }
    
    
    var body: some View {
        Form {
            Section(header:Text("Date Picker 1")){DatePicker("Pick a date:", selection: $currentTime)
                
            }
            
            Section(header:Text("Date Picker 2")){DatePicker("Pick a future date:", selection: $currentTime, in: Date()...)
                
            }
            
            Section(header:Text("Date Picker 3")){DatePicker("Pick an old date:", selection: $currentTime, in: closedRange...Date())
                
            }
            
            Section(header:Text("Date Picker 4")){DatePicker("Pick an time stamp:", selection: $currentTime, displayedComponents: .hourAndMinute)
                
            }
            
            Section(header:Text("Result")){
                
                Text(formatDate())
                
            }
        
        }
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
