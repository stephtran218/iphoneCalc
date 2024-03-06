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
    @State private var calcScreen: Int = 0
    
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
                                Button("\(text)", action: {})
                                    .font(.system(size: 32))
                                    .frame(width: 70, height: 70)
                                    .background(.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            } else if text == "0"{
                                Button("\(text)", action: {})
                                    .font(.system(size: 32))
                                    .frame(width: 150, height: 70)
                                    .background(.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            } else if text == "AC" || text == "+/-" || text == "%"{
                                Button("\(text)", action: {})
                                    .font(.system(size: 32))
                                    .frame(width: 70, height: 70)
                                    .background(lightGray)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            } else{
                                Button("\(text)", action: {})
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
}

func handleClicks(){
    
}


#Preview {
    ContentView()
}
