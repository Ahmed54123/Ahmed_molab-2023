//
//  DonationForm.swift
//  localShare_App
//
//  Created by ahmed casual on 12/12/23.
//

import SwiftUI


struct DonationForm: View {
//
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment (\.dismiss) var dismiss
    
    //INIT VARIABLES
    @State var itemName = ""
    @State var vegan = false
    @State var nonFat = false
    @State var halal = false
    @State var glutenFree = false
    @State var expireDate = Date()
    
    let formateStringToDate = DateFormatter()
    
    
  

    
    var body: some View {
        
        
        
        NavigationView{
            VStack{
                
                Form
                {
                    TextField("Item Name", text: $itemName)
                    
                    DatePicker("Select an expire date", selection: $expireDate, displayedComponents: [.date])
                    
                    Section(header: Text("food tags")){
                        
                        Toggle("vegan", isOn: $vegan)
                        Toggle("non-fat", isOn: $nonFat)
                        Toggle("halal", isOn: $halal)
                        Toggle("gluten free", isOn: $glutenFree)
                        
                       
                        
                    }
                    
                    
                }
                
                
                
               
                
                HStack{
                    Spacer()
                    Button("submit"){
                        
                        //COREDATA
                        DataController().addItem(itemName: itemName, vegan: vegan, nonFat: nonFat, halal: halal, glutenFree: glutenFree, expireDate: expireDate, context: managedObjectContext)
                        dismiss()
                    }
                    
                    Spacer()
                    
                }
                
                
            }
            .navigationTitle("donate item")
            
        }
        
        
        
    }
    
    
    
    

}

func FormatDate(formatDate: Date) -> String{
        let components = Calendar.current.dateComponents([.day, .year, .month], from: formatDate)

        let day = components.day ?? 0
        let month = components.month ?? 0
        let year = components.year ?? 0
        
        return "\(day)/\(month)/\(year)"
        
    }


struct DonationForm_Previews: PreviewProvider {
    static var previews: some View {
        DonationForm()
    }
}
