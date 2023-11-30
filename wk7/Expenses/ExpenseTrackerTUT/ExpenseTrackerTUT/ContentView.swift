//
//  ContentView.swift
//  ExpenseTrackerTUT
//
//  Created by ahmed casual on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //MARK: TITLE
                    Text("Overview")
                        .font(.title2)
                        .bold()

                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                //notif icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
            
            
        }
        .navigationViewStyle(.stack)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group{
                ContentView()
                ContentView().preferredColorScheme(.dark)
            }
        }
        
    }
}
