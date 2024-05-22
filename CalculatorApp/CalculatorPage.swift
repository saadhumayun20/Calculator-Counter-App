//
//  CalculatorPage.swift
//  CalculatorApp
//
//  Created by Saad Humayun on 2024-05-21.
//

import SwiftUI

enum CalcButton: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case add = "+"
    case subtract = "-"
    case multiply = "X"
    case divide = "/"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .equal, .divide:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
        
    }
    
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct CalculatorPage: View {
    
    @State var value = "0"
    @State var runningTotal = 0.0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 12) {
                Spacer()
                //Text
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 85))
                        .foregroundColor(.white)
                }
                .padding()
                //Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                                
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    
                }
            }
        }
    }
    
    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningTotal = Double(self.value) ?? 0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningTotal = Double(self.value) ?? 0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningTotal = Double(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningTotal = Double(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningTotal
                let currentValue = Double(self.value) ?? 0
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .none:
                    break
                }
            }
            if button != .equal {
                self.value = "0"
            }
            
        case .clear:
            self.value = "0"
            
        case .decimal:
            if !self.value.contains(".") {
                self.value = "\(self.value)."
            }
        case .negative:
            if let doubleVal = Double(self.value) {
                self.value = "\(doubleVal * -1)"
            }
        case .percent:
            if let doubleVal = Double(self.value) {
                self.value = "\(doubleVal / 100)"
            }
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
}

#Preview {
    CalculatorPage()
}
