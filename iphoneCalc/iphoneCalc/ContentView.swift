//
//  ContentView.swift
//  iphoneCalc
//
//  Created by StudentAM on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    let lightGray = Color(red: 211, green: 211, blue: 211)
    @State private var numsAndOperations: [[String]] = [
            ["AC","+/-", "%", "÷"],
            ["7","8", "9", "x"],
            ["4","5", "6", "-"],
            ["1","2", "3", "+"],
            ["0", " . " , "="]
        ]
    @State private var calcScreen: Int = 0
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    Text("\(calcScreen)")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size:52))
                }
                HStack{
                    Button("AC", action: clear)
                        .frame(width: 70, height: 70)
                        .background(lightGray)
                        .foregroundColor(.black)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("+/-", action: negNum)
                        .frame(width: 70, height: 70)
                        .background(lightGray)
                        .foregroundColor(.black)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("%", action: percent)
                        .frame(width: 70, height: 70)
                        .background(lightGray)
                        .foregroundColor(.black)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("÷", action: divide)
                        .frame(width: 70, height: 70)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                }
                HStack{
                    Button("7", action: seven)
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("8", action: eight)
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("9", action: nine)
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("x", action: multiply)
                        .frame(width: 70, height: 70)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                }
                HStack{
                    Button("4", action: four)
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("5", action: five)
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("6", action: six)
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("-", action: multiply)
                        .frame(width: 70, height: 70)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                }
                HStack{
                    Button("1", action: four)
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("2", action: five)
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("3", action: six)
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("+", action: multiply)
                        .frame(width: 70, height: 70)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                }
                HStack{
                    Button("0", action: four)
                        .frame(width: 150, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button(".", action: five)
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                    Button("=", action: six)
                        .frame(width: 70, height: 70)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(35)
                        .font(.system(size:30))
                }
            }

            .padding()
        }
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
    func four(){
        
    }
    func five(){
        
    }
    func six(){
        
    }
    func multiply(){
        
    }
    func press(){
        
    }
}

#Preview {
    ContentView()
}
