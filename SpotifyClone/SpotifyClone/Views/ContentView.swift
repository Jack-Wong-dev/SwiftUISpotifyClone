//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Jack Wong on 5/1/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            HomePage()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
            }
            .tag(0)
            SearchPage()
                .font(.title)
                .tabItem {
                    VStack {
                       Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .tag(1)
            Text("Third View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Third")
                    }
            }
            .tag(2)
            Text("Fourth View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Fourth")
                    }
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
