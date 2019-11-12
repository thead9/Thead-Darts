//
//  NewGameModal.swift
//  TheadDarts
//
//  Created by Thomas Headley on 11/12/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct NewGameModal: View {
    var affirmativeAction = { }
    var cancelAction = { }
    
    var body: some View {
        VStack {
            Text("New Game")
                .font(.largeTitle)
            Text("Are you sure you want to start a new game?")
                .multilineTextAlignment(.center)
            
            HStack {
                Button(action: {
                    withAnimation {
                        self.affirmativeAction()
                    }
                }) {
                    Text("Yes")
                        .padding()
                        .frame(maxWidth: 200)
                }
                .buttonStyle(DestructiveButtonStyle())
                Button(action: {
                    withAnimation {
                        self.cancelAction()
                    }
                }) {
                    Text("No")
                        .padding()
                        .frame(maxWidth: 200)
                }
                .buttonStyle(SecondaryButtonStyle(addBorder: false))
            }
            .padding(.top)
        }
        .font(.title)
        .padding()
        .background(Color.select(.background))
        .cornerRadius(25)
    }
}

struct NewGameModal_Previews: PreviewProvider {
    static var previews: some View {
        NewGameModal()
    }
}
