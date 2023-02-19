//
//  ContentView.swift
//  slot_machine_group16
//
//  Author Name: Yachao xiong 301298033, Sao I, Kuan 301204757
//
//  Revision
//  v1.0
//  init project                            2023-01-22.
//  added welcome screen                    2023-01-22.
//  added slot machine screen               2023-01-22.
//  v2.0
//  added spin function                                     2023-02-05
//  updated spin function and added quit function           2023-02-05
//  add version infor                                       2023-02-05
//
//
//  About the APP
//  The slot machine app generates a game of chance by randomly selecting symbols on reels,
//  Players match these symbols in a combination to generate payouts,
//  and they vary in themes, pay lines
//
import SwiftUI
import Firebase


struct ContentView: View {
  
    @State var showSlotMachine = false
    var body: some View {
        VStack {
            Image("slot")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)

            Text("Welcome to Slot Machine")
                .font(.title)
                .foregroundColor(.primary)
                .padding()

            Button(action: {
                self.showSlotMachine.toggle()
            }) {
                Text("Start Playing")
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                }
            .padding()
        }
        .fullScreenCover(isPresented: $showSlotMachine, content: {
            SlotMachineView()
                .edgesIgnoringSafeArea(.all)
        })
    }
    func addNewUser(){
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
