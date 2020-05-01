//
//  ContentItemViewer.swift
//  SpotifyClone
//
//  Created by Jack Wong on 5/1/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//

import SwiftUI

struct ContentItemViewer: View {
    
    var topSpacerHeight: CGFloat = 400
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 50)
                Image("westworld")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("Title")
                Text("Subtitle")
                    .foregroundColor(.init(red: 0.5, green: 0.5, blue: 0.5))
                Spacer()
            }
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                            .frame(height: topSpacerHeight)
                            .background(
                                LinearGradient(gradient: Gradient(colors:  [.clear,.clear,.clear,.clear,.black]), startPoint: .top, endPoint: .bottom)
                        )
                    }
                    
                    VStack {
                        ForEach(0..<30) { indicator in
                            HStack {
                                Text("\(indicator)")
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                    }
                    .background(Color.black)
                }
                .background(Color.yellow.opacity(0.1))
                
            }
        }
    }
}

struct ContentItemViewer_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemViewer()
    }
}
