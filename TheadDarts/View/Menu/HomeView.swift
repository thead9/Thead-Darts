//
//  MainMenuView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/14/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: CricketGameView(cricketGame: CricketGame(numberOfPlayers: 2))) {
                Text("Cricket")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .font(.title)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
