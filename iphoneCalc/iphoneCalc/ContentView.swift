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
    @State private var factor1: String = "0"
    //this sets the second factor as 0 for the user to later input their's
    @State private var factor2: String = "0"
    
    //this sets the var to be false, assuming the value the user puts in doesn't contain a decimal
    @State private var isDecimal: Bool = false
    
    @State private var storedOperator: String = ""
    
    
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
                        .font(.system(size:80))
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
                                    .frame(width: 88, height: 88)
                                    .background(storedOperator == text ? Color.white : Color.orange)
                                    .foregroundColor(storedOperator == text ? Color.orange : Color.white)
                                    .cornerRadius(55)
                            //If the button is 0, the padding will be diff bc it's wider
                            } else if text == "0"{
                                Button("\(text)", action: { handleClicks(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 178, height: 88)
                                    .background(.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(55)
                            //If buttons are the top row, it will be light gray
                            } else if text == "AC" || text == "+/-" || text == "%"{
                                Button("\(text)", action: { handleClicks(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 88, height: 88)
                                    .background(lightGray)
                                    .foregroundColor(.black)
                                    .cornerRadius(55)
                            //the rest of the buttons will be gray
                            } else if text == "="{
                                Button("\(text)", action: { displayAnswer(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 88, height: 88)
                                    .background(.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(55)
                            }else{
                                Button("\(text)", action: { handleClicks(text: text) })
                                    .font(.system(size: 32))
                                    .frame(width: 88, height: 88)
                                    .background(.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(55)
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
            calcScreen = "\(calcScreen)"
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
            isDecimal = true
            if let num = Double(calcScreen) {
                //this will return it back into a string for display
                calcScreen = String(num)
            }
        //if it doesn't have a decimal, the string will be convereted into an Int for calculations
        } else {
            isDecimal = false
            //this converts it from string to int
            if let intNum = Int(calcScreen) {
                //this converts it back into a string for display
                calcScreen = String(intNum)
            }
        }
    }
    
    //this function is responsible for saving values as the first factor
    func saveFactOne(){
        factor1 = calcScreen
    }
    
    //this function handles the operation buttons
    func operators(text: String) {
        
        checkIfDecimal()
        saveFactOne()
        //this resets screen back to 0 after user clicks the operation button (assuming they finished inputting their value)
        calcScreen = "0"
        storedOperator = text
    }
    
    //this function is responsible for saving factor2
    func saveFactTwo(){
        factor2 = calcScreen
    }
    
    //this function is responsible for displaying the answer after user clicks equal button
    func displayAnswer(text: String){
        if text == "="{
            checkIfDecimal()
            saveFactTwo()
            completeOperation()
            storedOperator = ""
        }
    }
    
    //this function is responsible for completing the operations
    func completeOperation(){
        //this var holds the answer that will be calculated
        var calculatedAnswer: Double = 0.0
        
        if isDecimal == true{
            if let factor1Value = Double(factor1), let factor2Value = Double(factor2) {
                //if they chose to divide,
                if storedOperator == "÷"{
                    //the calulated answer will be factor1 divided by factor2
                    calculatedAnswer = factor1Value / factor2Value
                    //the calculator screen will be updated w/ the answer
                    calcScreen = String(calculatedAnswer)
                    //if the user tries to divide a value by 0,
                    if factor2Value == 0.0{
                        //the screen will display error because that's undetermined
                        calcScreen = "Error"
                    }
                //if the user wants to multiply,
                }else if storedOperator == "x" {
                    //factor 1 and factor 2 will be multiplied together
                    calculatedAnswer = factor1Value * factor2Value
                    //this converts the answer back into a string to display on the screen
                    calcScreen = String(calculatedAnswer)
                //if the user wants to add,
                }else if storedOperator == "+"{
                    //factor 1 and factor 2 will be multiplied together
                    calculatedAnswer = factor1Value + factor2Value
                    //this converts the answer back into a string to display on the screen
                    calcScreen = String(calculatedAnswer)
                } else{
                    //this is the last operator option (subtraction) so it will take factor 1 and subtract that by factor 2
                    calculatedAnswer = factor1Value - factor2Value
                    //this converts the answer back into a string to display on the screen
                    calcScreen = String(calculatedAnswer)
                }
                
            }
            //If the returned value is an integer but has a ".0",
            if calcScreen.contains(".0"){
                //this will convert the answer into an integer, removing the ".0"
                if let doubleAnswer = Double(calcScreen){
                    let intAnswer = Int(doubleAnswer)
                    //this converts the value back into a string to display on the calculator
                    calcScreen = String(intAnswer)
                }
            }

        } else {
            //this variable will hold the calculated answer as an integer
            var calcAnswer: Int = 0
            
            //if the factors don't have a decimal,
            if !isDecimal{
                //factor 1 and factor 2 get converted into integers
                if let factor1Value = Int(factor1), let factor2Value = Int(factor2){
                    //if they chose to divide,
                    if storedOperator == "÷"{
                        //if they try to divide by 0, the screen will display "Error" b/c that's undetermined
                        if factor2Value == 0{
                            calcScreen = "Error"
                        } else{
                            //the calulated answer will be factor1 divided by factor2
                            calcAnswer = factor1Value / factor2Value
                            //the calculator screen will be updated w/ the answer
                            calcScreen = String(calcAnswer)
                        }
                    //if user wants to multiply, factor 1 and 2 will be multiplied as integers and converted back into a string
                    } else if storedOperator == "x"{
                        calcAnswer = factor1Value * factor2Value
                        calcScreen = String(calcAnswer)
                    //if operator is addition, factor one and two will be added as integers and later converted back into a string
                    } else if storedOperator == "+"{
                        calcAnswer = factor1Value + factor2Value
                        calcScreen = String(calcAnswer)
                    } else{
                        //the last operator is subtraction so factor1 and factor2 will be subtracted as integers and converted back into a string later
                        calcAnswer = factor1Value - factor2Value
                        calcScreen = String(calcAnswer)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

