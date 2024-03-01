//
//  ContentView.swift
//  iphoneCalc
//
//  Created by StudentAM on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numsAndOperations: [[String]] = [
            ["AC","+/-", "%", "÷"],
            ["7","8", "9", "x"],
            ["4","5", "6", "-"],
            ["1","2", "3", "+"],
            ["0", " . " , "="]
        ]
    @State private var calcScreen: Int = 0
    
    var body: some View {
        VStack{
            Text("\(calcScreen)")
            HStack{
                Button("AC", action: clear)
                    .padding(18)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                Button("+/-", action: negNum)
                    .padding(18)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                Button("%", action: percent)
                    .padding(18)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                Button("÷", action: divide)
                    .padding(18)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(50)
            }
            HStack{
                Button("7", action: seven)
                    .padding(18)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                Button("8", action: eight)
                    .padding(18)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                Button("9", action: nine)
                    .padding(18)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                Button("x", action: multiply)
                    .padding(18)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(50)
            }
        }

        .padding()
    }
    
    func clear(){
        calcScreen = 0
    }
    func negNum(){
        
    }
    func percent(){
        
    }
    func divide(){
        
    }
    func seven(){
        
    }
    func eight(){
        
    }
    func nine(){
        
    }
    func multiply(){
        
    }
}

#Preview {
    ContentView()
}
