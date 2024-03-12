//
//  ContentView.swift
//  iphoneCalc
//
//  Created by StudentAM on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    //this var holds the settings for the light cray shade color
    let lightGray = Color(red: 211/255, green: 211/255, blue: 211/255)
    //this var holds info for the buttons including the layout and all of their labels
    @State private var numsAndOperations: [[String]] = [
        ["AC","+/-", "%", "÷"],
        ["7","8", "9", "x"],
        ["4","5", "6", "-"],
        ["1","2", "3", "+"],
        ["0", "." , "="]
    ]
    //this sets the calulator screen to 0 before user inputs their own values
    @State private var calcScreen: String = "0"
    //this sets the first factor as 0 for user to later input their's
    @State private var factor1: Int = 0
    //this sets the second factor as 0 for the user to later input their's
    @State private var factor2: Int = 0
    
    var body: some View {
        
        ZStack{
            //this sets the background of the calculator to be fully black, ignoring the round borders (so black goes edge to edge)
            Color.black.ignoresSafeArea()
            VStack{
                //this adds some space in between calc screen and buttons from top of screen
                Spacer()
                HStack{
                    Spacer()
                    //this sets the calScreen to be the top component and its design (size, boldness, etc.)
                    Text("\(calcScreen)")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size:70))
                        .padding()
                }
                //this for loop will take everything in the numsAndOperations array and take every string as an individual button
                ForEach(numsAndOperations, id: \.self){ row in
                    HStack{
                        //if its an operation button, the color of the button will be orange
                        ForEach(row, id: \.self){ text in
                            if text == "÷" || text == "x" || text == "+" || text == "-"{
                                Button("\(text)", action: { operators(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 70, height: 70)
                                    .background(.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            //If the button is 0, the padding will be diff bc it's wider
                            } else if text == "0"{
                                Button("\(text)", action: { handleClicks(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 150, height: 70)
                                    .background(.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            //If buttons are the top row, it will be light gray
                            } else if text == "AC" || text == "+/-" || text == "%"{
                                Button("\(text)", action: { handleClicks(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 70, height: 70)
                                    .background(lightGray)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            //the rest of the buttons will be gray
                            } else if text == "="{
                                Button("\(text)", action: { displayAnswer(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 70, height: 70)
                                    .background(.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            }else{
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
    
    //this function will handle the clicks of every button
    func handleClicks(text: String) {
        // If the user clicks the "AC" button...
        if text == "AC" {
            // The calculator screen will display 0
            calcScreen = "0"
        //if the user chooses the neg button
        } else if text == "+/-" {
            //this checks if the value contains a decimal value
            if calcScreen.contains(".") {
                //this will change the string into a double for calculations since it contains a decimal
                if let num = Double(calcScreen) {
                    //this makes the value a neg or pos number and then converting back into a string onto calcScreen
                    calcScreen = String(num * -1)
                }
            } else {
                //num gets converted from string to int, if the number is just an int (whole number) the function will still convert it into neg/pos number and converts back to string
                if let num = Int(calcScreen) {
                    calcScreen = String(num * -1)
                }
            }
        //if the user selects the percentage button,
        } else if text == "%" {
            //the value on screen gets converted from
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
    
    //This function checks if the value has a decimal in it
    func checkIfDecimal(){
        //if calcScreen has a period in it, it will be read as decimal
        if calcScreen.contains(".") {
            //this will convert string into double for calcs
            if let num = Double(calcScreen) {
                //this will return it back into a string for display
                calcScreen = String(num)
            }
        //if it doesn't have a decimal, the string will be convereted into an Int for calculations
        } else {
            //this converts it from string to int
            if let intNum = Int(calcScreen) {
                //this converts it back into a string for display
                calcScreen = String(intNum)
            }
        }
    }
    
    //this function is responsible for saving values as the first factor
    func saveFactOne(num: String, intNum: Int){
        //this converts the num as a double if it contains a decimal
        if let firstValue = Double(calcScreen){
            //this saves it back into a string
            calcScreen = String(firstValue)
            //this turns it back into an int so that it can be saved in factor one variable
            if let decimalFactOne = Int(calcScreen){
                factor1 += decimalFactOne
            }
        } else{
            factor1 += intNum
        }
    }
    
    //this function handles the operation buttons
    func operators(text: String) {
        //if the click the divide button, it will check if it has a decimal
        if text == "÷" {
            checkIfDecimal()
            saveFactOne(num: String, intNum: <#T##Int#>)
            //this resets screen back to 0 after user clicks the operation button (assuming they finished inputting their value)
            calcScreen = "0"
        //if the click the divide button, it will check if it has a decimal
        } else if text == "x" {
            checkIfDecimal()
            saveFactOne(num: <#T##String#>, intNum: <#T##Int#>)
            //this resets screen back to 0 after user clicks the operation button (assuming they finished inputting their value)
            calcScreen = "0"
        //if the click the divide button, it will check if it has a decimal
        } else if text == "+" {
            checkIfDecimal()
            saveFactOne(num: <#T##String#>, intNum: <#T##Int#>)
            //this resets screen back to 0 after user clicks the operation button (assuming they finished inputting their value)
            calcScreen = "0"
        //if the click the divide button, it will check if it has a decimal
        } else {
            checkIfDecimal()
            saveFactOne(num: <#T##String#>, intNum: <#T##Int#>)
            //this resets screen back to 0 after user clicks the operation button (assuming they finished inputting their value)
            calcScreen = "0"
        }
    }
    
    //this function is responsible for saving factor2
    func saveFactTwo(num: String, intNum: Int){
        //thi converts second value into double if it has a decimal
        if let secondValue = Double(calcScreen){
            //this converts the double back into a string bc calcScreen only takes strings
            calcScreen = String(secondValue)
            //this converts the string back into an int so that it can be saved in the factor2 var
            if let decimalFactTwo = Int(calcScreen){
                factor2 += decimalFactTwo
            } else {
                //if the num is already an int, it doesn't need to be converted and just saved into factor2 already
                factor2 += intNum
            }
        }
    }
    
    //this function is responsible for displaying the answer after user clicks equal button
    func displayAnswer(text: String){
        if text == "="{
            checkIfDecimal()
            saveFactTwo(num: calcScreen, intNum: Int)
            completeOperation(text: String)
        }
    }
    
    //this function is responsible for completing the operations
    func completeOperation(text: String){
        //this var holds the answer that will be calculated
        var calculatedAnswer: Int = 0
        
        //if they chose to divide,
        if text == "÷"{
            //the calulated answer will be factor1 divided by factor2
            calculatedAnswer = factor1 / factor2
            //the calculator screen will be updated w/ the answer
            calcScreen = String(calculatedAnswer)
        } else if text == "x"{
            calculatedAnswer = factor1 * factor2
            calcScreen = String(calculatedAnswer)
        } else if text == "+"{
            calculatedAnswer = factor1 + factor2
            calcScreen = String(calculatedAnswer)
        } else{
            calculatedAnswer = factor1 - factor2
            calcScreen = String(calculatedAnswer)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MAKE BOOLEAN TO SAVE IF IT HAS A DECIMAL OR NOT
