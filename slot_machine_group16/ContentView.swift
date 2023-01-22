//
//  ContentView.swift
//  slot_machine_group16
//
//  Created by Yachao on 2023-01-22.
//

import SwiftUI

struct ContentView: View {
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
                // Navigate to SlotMachineView
            }) {
                Text("Start Playing")
                                 .foregroundColor(.white)
                                 .padding()
                                 .background(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing))
                                 .cornerRadius(10)
                         }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
