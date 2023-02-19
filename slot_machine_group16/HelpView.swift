

import SwiftUI

struct HelpView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            Color(red: 237/255, green: 237/255, blue: 237/255)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Text("How to Play")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                Text("1. Choose your bet amount by tapping on the buttons below the Credit and Bet sections. You can bet 10, 50, or 100 credits.")
                    .fixedSize(horizontal: false, vertical: true)
                Text("2. Tap the SPIN button to spin the slot machine.")
                    .fixedSize(horizontal: false, vertical: true)
                Text("3. The result section will show you how much you have won or lost on the current spin.")
                    .fixedSize(horizontal: false, vertical: true)
                Text("4. If you get three of the same symbols in a row, you will win a payout according to the following table:")
                    .fixedSize(horizontal: false, vertical: true)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Symbol")
                            .fontWeight(.bold)
                        Spacer()
                        Text("Payout")
                            .fontWeight(.bold)
                    }
                    HStack {
                        Text("Apple")
                        Spacer()
                        Text("10x Bet")
                    }
                    HStack {
                        Text("Banana")
                        Spacer()
                        Text("10x Bet")
                    }
                    HStack {
                        Text("Blueberry")
                        Spacer()
                        Text("10x Bet")
                    }
                    HStack {
                        Text("Bar")
                        Spacer()
                        Text("Jackpot and 20x Bet")
                    }
                    HStack {
                        Text("Clover")
                        Spacer()
                        Text("20x Bet")
                    }
                }
                Text("5. If you get three BAR symbols in a row, you will win the jackpot and all your current winnings.")
                    .fixedSize(horizontal: false, vertical: true)
                Text("6. You can reset the game to the default settings by tapping the RESET button.")
                    .fixedSize(horizontal: false, vertical: true)
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Back")
                            .foregroundColor(.white)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                        }
                }
             
            }
            .padding(.top, 40)
            .padding(.horizontal, 20)
        }
    }
}



struct HelpVieww_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
