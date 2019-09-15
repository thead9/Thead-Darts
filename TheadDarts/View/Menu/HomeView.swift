//
//  MainMenuView.swift
//  TheadDarts
//
//  Created by Thomas Headley on 9/14/19.
//  Copyright © 2019 Thead. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "Secondary") ?? UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(height: 2, alignment: .bottom)
                        .foregroundColor(Color("Primary"))
                    
                    NavigationLink(destination: CricketGameView(cricketGame: CricketGame(numberOfPlayers: 2))) {
                        Text("Cricket")
                            .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.4)
                    }        
                    
                    Rectangle()
                        .frame(height: 2, alignment: .bottom)
                        .foregroundColor(Color("Primary"))
                    
                    NavigationLink(destination: CricketGameView(cricketGame: CricketGame(numberOfPlayers: 2))) {
                        Text("Cricket")
                            .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.4)
                    }
                    
                    Rectangle()
                        .frame(height: 2, alignment: .bottom)
                        .foregroundColor(Color("Primary"))
                    
                    Image(systemName: "gear")
                        .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.2)
                    
                    Rectangle()
                        .frame(height: 2, alignment: .bottom)
                        .foregroundColor(Color("Primary"))
                }
                .navigationBarTitle(Text("Thead Darts"))
                .background(Color("HitBackground"))
                .foregroundColor(Color("Secondary"))
            }
        }
        .font(.title)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
