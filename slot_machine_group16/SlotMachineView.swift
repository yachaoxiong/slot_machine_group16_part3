//
//  SlotMachineView.swift
//  slot_machine_group16
//
//  Author Name: Yachao xiong 301298033, Sao I, Kuan 301204757
//
//  Revision
//  init project                            2023-01-22.
//  added welcome screen                    2023-01-22.
//  added slot machine screen               2023-01-22.
//
//
//  About the APP
//  The slot machine app generates a game of chance by randomly selecting symbols on reels,
//  Players match these symbols in a combination to generate payouts,
//  and they vary in themes, pay lines
//
//

import SwiftUI

struct SlotMachineView: View {
    @State private var images: [String] = ["blank", "blank", "blank"]
    @State private var result = 0
    @State private var jackpot = 10000
    @State private var credit = 2000
    @State private var bet = 10
    @State private var showAlert = false
    
    var spinEnabled: Bool {
        return credit >= bet
    }

    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.8, green: 0, blue: 0), Color(red: 0.8, green: 0.4, blue: 0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    VStack {
                        Image("jackpot")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 60)
                            .padding(50)
                        InfoCardView(title: "", value:String(jackpot),width: 320, height: 80)
                    }
                    HStack {
                        CardView(image: images[0])
                            .padding(10)
                        CardView(image: images[1])
                            .padding(10)
                        CardView(image: images[2])
                            .padding(10)
                    }
                    .padding()
                    HStack {
                        InfoCardView(title: "Result", value: "\(result)", width: 360)
                    }
                    HStack {
                        InfoCardView(title: "Credit", value: "\(credit)",width: 160)
                            .padding()
                        InfoCardView(title: "Bet", value: "\(bet)",width: 160)
                            .padding()
                    }
                    HStack {
                        ImageButton(image: "bet10", action:  {
                            if(self.credit >= 10){
                                self.bet = 10
                            }
                            
                        },isEnabled: self.credit >= 10)
                        .padding(5)
                        ImageButton(image: "bet50", action:  {
                            if(self.credit >= 50){
                                self.bet = 50
                            }
                        },isEnabled: self.credit >= 50)
                        .padding(5)
                        ImageButton(image: "bet100", action:  {
                            if(self.credit >= 100){
                                self.bet = 100
                            }
                        },isEnabled: self.credit >= 100)
                        .padding(5)
                    }
                    .padding()
                    ImageButton(image: spinEnabled ? "spin" : "spinGray", action:  {
                        self.spin()
                    },isEnabled:spinEnabled)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Congratulations！！！You Win Jackpot"),
                                        message: Text(" "),
                                        dismissButton: .default(Text("Close")))
                    }
                    HStack {
                        ImageButton(image: "reset", action: {
                            self.reset()
                        },isEnabled:true)
                        Spacer()
                        ImageButton(image: "quit", action:  {
                            presentationMode.wrappedValue.dismiss()
                        },isEnabled:true)
                    }
                    .padding()
                   
                }
            }
        }
    }
    private func spin() {
    self.result = 0
    self.credit -= self.bet
    let images = ["blueberry", "banana", "apple", "bar", "clover"]
    for i in 0...2 {
    self.images[i] = images.randomElement()!
    }
    if self.images[0] == self.images[1] && self.images[1] == self.images[2] {
        if(self.images[0] == "bar") {
            self.result = jackpot
            self.result += bet * 20
            showAlert = true
          }else if(self.images[0] == "clover") {
              self.result = bet * 20
          }else{
              self.result = bet * 10
          }
      }
      self.credit += self.result
  }

  private func reset() {
        self.bet = 10
        self.result = 0
        self.credit = 2000
        for i in 0...2 {
        self.images[i] = "blank"
        }
   }
    
 private func quit() {
     print("quit...")
     presentationMode.wrappedValue.dismiss()
  }
 struct CardView: View {
        var image: String
        var body: some View {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 90)
                .overlay(RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.gray, lineWidth: 5)
                )
                .background(Color.white)
        }
    }
    
 struct InfoCardView: View {
        var title: String
        var value: String
        var width: CGFloat = 100
        var height: CGFloat = 50
        var body: some View {
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: width, height: height)
                    .foregroundColor(.black)
                    .overlay(
                        Text(value)
                            .foregroundColor(.red)
                            .font(.title)
                            .padding()
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.white, lineWidth: 5)
                    )
            }
        }
    }
    
    struct ImageButton: View {
        var image: String
        var action: () -> Void
        var isEnabled: Bool
        var body: some View {
            Button(action: action) {
                Image(image)
                    .renderingMode(.original)
            }.disabled(!isEnabled)
        }
       
    }
    
 struct CustomAlertView: View {
        @Binding var isPresented: Bool
        var title: String
        var message: String
        var buttonText: String
        
        var body: some View {
            VStack {
                Text(title)
                    .font(.title)
                    .padding()
                Text(message)
                    .font(.body)
                    .padding()
                Button(action: {
                    self.isPresented = false
                }) {
                    Text(buttonText)
                        .font(.headline)
                        .padding()
                }
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
    
}
