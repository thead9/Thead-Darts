//
//  EditPlayerNameModal.swift
//  TheadDarts
//
//  Created by Thomas Headley on 2/21/20.
//  Copyright © 2020 Thead. All rights reserved.
//

import SwiftUI

struct EditPlayerNameModal: View {
    var affirmativeAction: (String) -> () = { _ in }
    var cancelAction = { }
    
    @State var playerName: String
    
    var body: some View {
        VStack {
            Text("Change Player Name")
                .font(.largeTitle)
            
            TextField("Player Name", text: $playerName, onEditingChanged: { editing in if editing { self.playerName = "" } }, onCommit: { self.affirmativeAction(self.playerName) } )
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .padding()
                .addBorder(Color.select(.primary))
            
            HStack {
                Button(action: { withAnimation { self.affirmativeAction(self.playerName) } } ) {
                    Text("Confirm")
                        .padding()
                        .frame(maxWidth: 200)
                }
                .buttonStyle(PrimaryButtonStyle())
                Button(action: { withAnimation { self.cancelAction() } } ) {
                    Text("Cancel")
                        .padding()
                        .frame(maxWidth: 200)
                }
                .buttonStyle(SecondaryButtonStyle(addBorder: false))
            }
            .padding(.top)
        }
        .frame(maxWidth: 500)
        .font(.title)
        .padding()
        .background(Color.select(.background))
        .cornerRadius(25)
    }
}

struct EditPlayerNameModal_Previews: PreviewProvider {
    static var previews: some View {
        EditPlayerNameModal(playerName: "Player 1")
    }
}
