//
//  ContentView.swift
//  iphoneCalc
//
//  Created by StudentAM on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    let lightGray = Color(red: 211/255, green: 211/255, blue: 211/255)
    @State private var numsAndOperations: [[String]] = [
        ["AC","+/-", "%", "÷"],
        ["7","8", "9", "x"],
        ["4","5", "6", "-"],
        ["1","2", "3", "+"],
        ["0", " . " , "="]
    ]
    @State private var calcScreen: String = "0"
    @State private var factor1: Int = 0
    @State private var factor2: Int = 0
    
    var body: some View {
        
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Spacer()
                
                HStack{
                    Spacer()
                    Text("\(calcScreen)")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size:52))
                        .padding()
                }
                ForEach(numsAndOperations, id: \.self){ row in
                    HStack{
                        ForEach(row, id: \.self){ text in
                            if text == "÷" || text == "x" || text == "+" || text == "-" || text == "="{
                                Button("\(text)", action: { calculate(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 70, height: 70)
                                    .background(.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            } else if text == "0"{
                                Button("\(text)", action: { handleClicks(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 150, height: 70)
                                    .background(.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            } else if text == "AC" || text == "+/-" || text == "%"{
                                Button("\(text)", action: { handleClicks(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 70, height: 70)
                                    .background(lightGray)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            } else{
                                Button("\(text)", action: { handleClicks(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 70, height: 70)
                                    .background(.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func handleClicks(text: String) {
        // If the user clicks the "AC" button...
        if text == "AC" {
            // The calculator screen will display 0
            calcScreen = "0"
        } else if text == "+/-" {
            if calcScreen.contains(".") {
                if let num = Double(calcScreen) {
                    calcScreen = String(num * -1)
                }
            } else {
                if let num = Int(calcScreen) {
                    calcScreen = String(num * -1)
                }
            }
        } else if text == "%" {
            if let num = Double(calcScreen) {
                calcScreen = String(num * 0.01)
            }
            calcScreen = "\(calcScreen)%"
        } else if text == "=" {
            // Add functionality for calculating the result here
        } else {
            // When the calculator screen displays 0...
            if calcScreen == "0" {
                // The next button the user clicks becomes the value in the text variable
                calcScreen = text
            } else {
                // This allows the user to type in more than one digit (ex. values) even when the calc screen is no longer displaying just 0
                calcScreen += text
            }
        }
    }

    func calculate(text: String) {
        if text == "÷" {
            if calcScreen.contains(".") {
                if let num = Double(calcScreen) {
                    calcScreen = String(num)
                    if let intNum = Int(calcScreen) {
                        factor1 += intNum
                    }
                }
            } else {
                if let num = Int(calcScreen){
                    factor1 += num
                }
            }
        } else if text == "x" {
            
            factor1 += Double(calcScreen)
        } else if text == "+" {
            factor1 += Double(calcScreen)
        } else {
            factor1 += Double(calcScreen)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
