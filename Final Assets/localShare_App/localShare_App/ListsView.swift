//
//  ListsView.swift
//  localShare_App
//
//  Created by ahmed casual on 12/7/23.
//

import SwiftUI

struct ListsView: View {
    
    var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    @State var veggies: [String] = ["Carrots", "cucumbers", "potatos", "eggplant"]
    
    var body: some View {
        NavigationView {
            List{
                Section(
                    header: Text("Fruits")){
                        ForEach(fruits, id: \.self){ fruit in
                            Text(fruit.capitalized)
                        }
                        .onDelete(perform: {indexSet in delete(indices: indexSet, var: fruits)})
                     //   .onMove(perform: {indices, newOffset in move(indices: indices, newOffset: newOffset, listToChange: fruits)})
                    }
                
                Section(header: Text("Veggies")){
                    ForEach(veggies, id: \.self){ veggies in Text(veggies.capitalized)
                        
                    }
                    .onDelete(perform: {indices in delete(indices: indices, var: veggies)})
                    .onMove(perform: {indices, newOffset in move(indices: indices, newOffset: newOffset, var: veggies)})
                    
                }
                
                
            }
            .navigationTitle("Grocery List")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    addButton
                }
            }
        }
        
            
        }
    
    var addButton: some View {
        Button("Add", action: {
            add(var: fruits)
        })
    }
        
    func delete(indices: IndexSet, @State var listToChange: Array<String>){
            listToChange.remove(atOffsets: indices)
            
        }
        
    func move(indices: IndexSet, newOffset: Int, @State `var` listToChange: Array<String>){
            listToChange.move(fromOffsets: indices, toOffset: newOffset)
        }
        
    func add(@State `var` listToChange: Array<String>){
            listToChange.append(String("Coconut"))
            
        }
        
        
    }
    
    
    struct ListsView_Previews: PreviewProvider {
        static var previews: some View {
            ListsView()
        }
    }
    

