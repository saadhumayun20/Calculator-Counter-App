//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Saad Humayun on 2024-05-20.
//

import SwiftUI

enum pageView: Identifiable {
    case counter, caluclator
    
    var id: Int {
        hashValue
    }
}

struct ContentView: View {
    @State private var activePage: pageView?
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack (spacing: 12){
                
                Button(action: {
                    self.activePage = .counter
                }, label: {
                    Text("Counter").bold()
                        .font(.system(size: 32))
                        .frame(width: 200, height: 100)
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .cornerRadius(35)
                        
                })
                
                Button(action: {
                    self.activePage = .caluclator
                }, label: {
                    Text("Calculator").bold()
                        .font(.system(size: 32))
                        .frame(width: 200, height: 100)
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .cornerRadius(35)
                })
            }
            
            
                .sheet(item: self.$activePage, onDismiss: {print("Page Closed")}) { item in
                    switch item {
                    case .counter:
                        CounterPage()
                    case .caluclator:
                        CalculatorPage()
                        
                    }
                    
                }
        }
        
    }
}

#Preview {
    ContentView()
}
