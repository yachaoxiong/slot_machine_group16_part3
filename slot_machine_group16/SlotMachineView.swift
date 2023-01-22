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
    var body: some View {
        ScrollView{
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.8, green: 0, blue: 0), Color(red: 0.8, green: 0.4, blue: 0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Image("jackpot")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 60)
                        .padding(5)
                    InfoCardView(title: "", value: "1000",width: 320, height: 80)
                }
                HStack {
                    CardView(image: "blank")
                    .padding(10)
                    CardView(image: "blank")
                    .padding(10)
                    CardView(image: "blank")
                    .padding(10)
                }
                .padding()
                HStack {
                    InfoCardView(title: "Result", value: "1000", width: 360)
                }
                HStack {
                    InfoCardView(title: "Credit", value: "5000",width: 160)
                        .padding()
                    InfoCardView(title: "Bet", value: "100",width: 160)
                        .padding()
                }
                HStack {
                    ImageButton(image: "bet10", action: /* add your action here */ {})
                        .padding(5)
                    ImageButton(image: "bet50", action: /* add your action here */ {})
                        .padding(5)
                    ImageButton(image: "bet100", action: /* add your action here */ {})
                        .padding(5)
                }
                .padding()
                ImageButton(image: "spin", action: /* add your action here */ {})
                HStack {
                    ImageButton(image: "reset", action: /* add your action here */ {})
                    Spacer()
                    ImageButton(image: "quit", action: /* add your action here */ {})
                }
                .padding()
            }
        }
        }
    }
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
    var body: some View {
    Button(action: action) {
    Image(image)
    .renderingMode(.original)
    }
  }
}
