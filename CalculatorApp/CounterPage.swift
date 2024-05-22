//
//  CounterPage.swift
//  CalculatorApp
//
//  Created by Saad Humayun on 2024-05-21.
//

import SwiftUI

struct CounterPage: View {

    @AppStorage("NUM_KEY") var count = 0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("\(count)")
                .bold()
                .font(.system(size: 256))
                .foregroundColor(.white)
                
                HStack (spacing: 64){
                    
                    Button(action: {
                        self.count -= 1
                    }, label: {
                        Text("-")
                            .bold()
                            .font(.system(size: 64))
                            .frame(width: 75, height: 75)
                            .background(Color.gray)
                            .foregroundColor(.black)
                            .cornerRadius(35)
                    })
                
                    Button(action: {
                        self.count += 1
                    }, label: {
                        Text("+")
                            .bold()
                            .font(.system(size: 64))
                            .frame(width: 75, height: 75)
                            .background(Color.gray)
                            .foregroundColor(.black)
                            .cornerRadius(35)
                    })
                    
                }
                
                HStack {
                    Button(action: {
                        self.count = 0
                    }, label: {
                        Text("RESET")
                            .bold()
                            .font(.system(size: 32))
                            .frame(width: 125, height: 100)
                            .background(Color.gray)
                            .foregroundColor(.black)
                            .cornerRadius(100)
                    })
                }
            }
        }
    }
}

#Preview {
    CounterPage()
}
