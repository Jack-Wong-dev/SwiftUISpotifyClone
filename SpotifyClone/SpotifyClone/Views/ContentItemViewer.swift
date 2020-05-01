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
            //Layer 0
            LinearGradient(gradient: Gradient(colors: [Color.init(red: 240/255, green: 170/255, blue: 160/255),
                                                       .black,
                                                       .black
                ]
            ), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            //Layer 1
            VStack {
                Spacer()
                    .frame(height: 50)
                Image("westworld")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("Title")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                Text("Subtitle")
                    .foregroundColor(.init(red: 0.5, green: 0.5, blue: 0.5))
                    .font(.system(size: 16,weight: .medium))
                
                Spacer()
            }
            //Layer 2
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
                                CellRow()
                                Spacer()
                            }
                        }
                    }
                    .background(Color.black)
                }
                .background(Color.clear)
                
            }
        }
    }
}

struct ContentItemViewer_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemViewer()
    }
}
