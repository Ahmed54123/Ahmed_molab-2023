//
//  DonationFormView.swift
//  localShare_App
//
//  Created by ahmed casual on 12/19/23.
//

import SwiftUI


class ItemViewModel: ObservableObject
{
    @Published var item: Item
    init(item: Item) {
        self.item = item
    }
}




struct DonationFormView: View {
    
    var shelfReference: FridgeShelf
    var thumbnailImage: String
    
    @State var currentDate = Date()
    @ObservedObject var itemVM = ItemViewModel(item: sampleItem)
    
    //item parameters
  
    
    var body: some View {
        
            NavigationStack{
                
                        
                
                ZStack{
                    
                    Color("bkColor").ignoresSafeArea()
                    
                    VStack{
                        Text("donate item")
                            .foregroundColor(Color("textColor"))
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .frame(alignment: .top)
                            .padding(.top)
                            .lineLimit(1)
                            .frame(maxHeight: 200)
                            
                        
                        HStack(alignment: .center)
                        {
                            VStack{
                                Image(shelfReference.thumbnailImage)
                                    .scaleEffect(0.3)
                                    .frame(maxWidth: 100, maxHeight: 200,alignment: .center)
                                    .padding(.leading, 150)
                                
                                Text(shelfReference.name)
                                    .frame(alignment: .center)
                                    .padding(.leading,150)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                            }
                                
                            VStack (alignment: .trailing){
                                
                                Text("Expire Date")
                                
                                    .padding(.trailing, 100)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .lineLimit(1)
                                    .font(.title3)
                                    .foregroundColor(Color("textColor"))
                                    .fontWeight(.heavy)
                                DatePicker("", selection: $currentDate, displayedComponents: .date)
                                    .frame(maxWidth: .greatestFiniteMagnitude, alignment: .center)
                                    .padding(.trailing)
                                    .datePickerStyle(.wheel)
                                    .foregroundColor(Color("textColor"))
                                 
                                
                                
                            }
                        }
                        .frame(maxHeight: 400)
                        
                        
                        VStack(alignment: .leading)
                        {
                            
                            TextField("Item Name", text: $itemVM.self.item.itemName)
                                .padding(200)
                                .frame(maxWidth: .infinity,maxHeight: 50,alignment: .center)
                                .textFieldStyle(.roundedBorder)
                                
                            
                            List
                            {
                                checklistButtonView(checkType: $itemVM.self.item.nonFat, typeLabel: "non-fat")
                                
                                checklistButtonView(checkType: $itemVM.self.item.vegan, typeLabel: "vegan")
                                
                                checklistButtonView(checkType: $itemVM.self.item.halal, typeLabel: "halal")
                                
                                
                                checklistButtonView(checkType: $itemVM.self.item.glutenFree, typeLabel: "gluten-free")
                            }
                            
                            
                            
                        }
                        
                        Button{
                            
                            shelfReference.shelfItems.append(itemVM.self.item)      
                            
                        } label: {
                            Image(systemName: "checkmark.message")
                                .foregroundColor(Color("textColor"))
                                .scaleEffect(3)
                        }
                        .frame(alignment: .trailing)
                        .padding(.leading, 250)
                            
                            
                        }
                        
                        
                    }
            }
        
               
            
        }
    
    struct checklistButtonView: View
    {
       @Binding var checkType: Bool
        var typeLabel: String
        var body: some View
        {
            Toggle(isOn: $checkType){
                Text(typeLabel)
                    .foregroundColor(Color("textColor"))
            }.toggleStyle(buttonCheckboxStyle())
                .padding(.leading, 80)
                .listRowBackground(Color("bkColor"))
        }
    }
            
        
            
        
        
    }
    
    
    struct DonationFormView_Previews: PreviewProvider {
        static var previews: some View {
            DonationFormView(shelfReference: sampleDairyShelf, thumbnailImage: sampleDairyShelf.name)
        }
    }

