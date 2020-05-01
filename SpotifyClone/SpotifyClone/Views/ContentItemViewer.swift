//
//  ContentItemViewer.swift
//  SpotifyClone
//
//  Created by Jack Wong on 5/1/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//

import SwiftUI

struct ContentItemViewer: View {
    @State private var playButtonOffset: CGFloat = 335
    
    private var topSpacerHeight: CGFloat = 400
    
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
                //Keep track of scrolling
                GeometryReader { geo -> AnyView? in
                    let thisOffset = geo.frame(in: .global).minY
                    
                    if thisOffset > -300 {
                        self.playButtonOffset = thisOffset
                    }else{
                        self.playButtonOffset = -300
                    }
                    return nil
                }
                
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
            //Layer 3
            VStack {
                Spacer()
                    .frame(height: playButtonOffset + 300)
                Text("PLAY")
                    .foregroundColor(.white)
                    .frame(width: 240, height: 50)
                    .background(Color.init(red: 30/255, green: 215/255, blue: 96/255))
                    .cornerRadius(25)
                    .font(.system(size: 20, weight: .bold))
                    .shadow(radius: 20)
                Spacer()
            }
            VStack {
                Text("\(playButtonOffset)")
                    .foregroundColor(.yellow)
                Spacer()
            }
        }
    }
}

struct ContentItemViewer_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemViewer()
    }
}
