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
                    
                    GeometryReader { cricketGeometry in
                        HStack(spacing: 0) {
                            NavigationLink(destination: CricketGameView(cricketGame: CricketGame(numberOfPlayers: 2))) {
                                    Text("Cricket")
                                        .frame(maxWidth: cricketGeometry.size.width * 0.75, maxHeight: .infinity)
                                }
                            
                            Rectangle()
                                .frame(width: 2)
                                .foregroundColor(Color("Primary"))
                                
                            VStack(alignment: .center) {
                                Image(systemName: "gear")
                            }
                            .frame(maxWidth: cricketGeometry.size.width * 0.25, maxHeight: .infinity)

                        }
                        .frame(maxWidth: .infinity, maxHeight: geometry.size.height / 2)
                        .background(Color("HitBackground"))
                        .foregroundColor(Color("Secondary"))
                    }
                    
                    Rectangle()
                        .frame(height: 2, alignment: .bottom)
                        .foregroundColor(Color("Primary"))
                    
                    GeometryReader { cricketGeometry in
                        HStack(spacing: 0) {
                            NavigationLink(destination: CricketGameView(cricketGame: CricketGame(numberOfPlayers: 2))) {
                                    Text("Cricket")
                                        .frame(maxWidth: cricketGeometry.size.width * 0.75, maxHeight: .infinity)
                                }
                            
                            Rectangle()
                                .frame(width: 2)
                                .foregroundColor(Color("Primary"))
                                
                            VStack(alignment: .center) {
                                Image(systemName: "gear")
                            }
                            .frame(maxWidth: cricketGeometry.size.width * 0.25, maxHeight: .infinity)

                        }
                        .frame(maxWidth: .infinity, maxHeight: geometry.size.height / 2)
                        .background(Color("HitBackground"))
                        .foregroundColor(Color("Secondary"))
                    }
                    
                    Rectangle()
                        .frame(height: 2, alignment: .bottom)
                        .foregroundColor(Color("Primary"))
                }
                .navigationBarTitle(Text("Thead Darts"))
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
