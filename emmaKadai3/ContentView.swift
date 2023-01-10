//
//  ContentView.swift
//  emmaKadai3
//
//  Created by Emma on 2022/12/18.
//

import SwiftUI

struct ContentView: View {
    //入力テキストString
    @State var inputText1: String = ""
    @State var inputText2: String = ""
    //符号選択ピッカー
    @State var signFlag1 = false
    @State var signFlag2 = false
    //入力テキストInt
    @State var inputNumber1: Int = 0
    @State var inputNumber2: Int = 0
    //計算式表示String
    @State var displayNumber1: String = ""
    @State var displayNumber2: String = ""
    //計算結果表示String
    @State var resultText: String = "Label"

    var body: some View {
        VStack(spacing: 15) {
            Text("課題3\n符号を反転させてから足し算するアプリ")
                .font(.headline)

            //入力エリア
            HStack(spacing: 15){
                //inputText1・符号
                InputTextView(inputTextNumber: $inputText1, signFlagNumber: $signFlag1)

                //inputText2・符号
                InputTextView(inputTextNumber: $inputText2, signFlagNumber: $signFlag2)
            }

            //計算式表示エリア
            HStack{
                //displayNumber1
                FormulaTextView(displayTextNumber: displayNumber1)

                Text("+")
                    .frame(width: 20)

                //displayNumber2
                FormulaTextView(displayTextNumber: displayNumber2)
            }

            // 計算ボタン
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                //Intに変換
                inputNumber1 = (Int(inputText1) ?? 0)
                inputNumber2 = (Int(inputText2) ?? 0)

                //符号確認
                //signFlag1がtrue = signFlag1はマイナス
                if signFlag1 { inputNumber1 = -inputNumber1 }
                //signFlag2がtrue = signFlag2はマイナス
                if signFlag2 { inputNumber2 = -inputNumber2 }

                //足し算
                resultText = String(inputNumber1 + inputNumber2)

                //表示用にStringに変換
                displayNumber1 = String(inputNumber1)
                displayNumber2 = String(inputNumber2)
            }
            .buttonStyle(.bordered)

            // 計算結果表示テキストフィールド
            Text("\(resultText)")
                .font(.title)
            Spacer()
        }
        .padding()

    }
}

//inputText入力エリア
struct InputTextView: View {
    @Binding var inputTextNumber: String
    @Binding var signFlagNumber: Bool

    var body: some View {
        //inputText入力テキストフィールド
        VStack(spacing: 15) {
            TextField("", text: $inputTextNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(TextAlignment.trailing)
                .keyboardType(.numberPad)

            //符号指定トグルボタン
            HStack{
                Text("+")
                Toggle("", isOn: $signFlagNumber).tint(.blue)
                Text("-")
            }
            .fixedSize()
        }
        .frame(width: 150)
    }
}

//displayNumber表示エリア
struct FormulaTextView: View {
    let displayTextNumber: String

    var body: some View {
        Text("\(displayTextNumber)")
            .padding()
            .frame(width: 140, height: 35, alignment: .trailing)
            .border(Color.secondary)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
