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
    @State var album: AlbumInfo
    private let topSpacerHeight: CGFloat = 400
    private let spotifyGreen = Color.init(red: 30/255, green: 215/255, blue: 96/255)
    
    
    var body: some View {
        ZStack {
            /** Layer 0 */
            LinearGradient(gradient: Gradient(colors: [getDominantColor(),
                                                       .black,
                                                       .black
                ]
            ), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            /** Layer 1:  */
            VStack {
                Spacer()
                    .frame(height: 50)
                Image(uiImage: album.albumImage)
                    //                Image("westworld")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text(album.song)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                Text("by \(album.artist)")
                    .foregroundColor(.init(red: 0.5, green: 0.5, blue: 0.5))
                    .font(.system(size: 16,weight: .medium))
                
                Spacer()
            }
            
            /** Layer 2 : "Table" */
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
                    //Actual Table starts here
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
            
            /** Filler Layer: Used to not have table's ellipsis overlap with top right ellipsis */
            VStack{
                LinearGradient(gradient: Gradient(colors: [getDominantColor(), .clear]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 300)
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            
            /** Layer 3: Play Button */
            VStack {
                Spacer()
                    .frame(height: playButtonOffset + 300)
                
                HStack{
                    if playButtonOffset > -300{
                        Text("PLAY")
                    }else{
                        Image(systemName: "play.fill")
                    }
                }
                .foregroundColor(.white)
                .frame(width: getPlayButtonWidth(), height: 50)
                .background(spotifyGreen)
                .cornerRadius(25)
                .font(.system(size: 17, weight: .bold))
                .shadow(radius: 20)
                Spacer()
            }
            
            /** Layer 4: On top: Left Chevron, Right Ellipsis */
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .foregroundColor(.white)
                .padding()
                Spacer()
            }
            
            //Debug layer
            VStack {
//                Text("\(playButtonOffset)")
//                    .foregroundColor(.yellow)
                Spacer()
            }
        }
    }
    
    func getPlayButtonWidth() -> CGFloat {
        if playButtonOffset > -150 {
            return 240
        }else if playButtonOffset <= -300 {
            return 50
        }else{
            let width: CGFloat = 240 - (190 * (((-1 * playButtonOffset) - 150) / 150))
            return width
        }
    }
    
    func getDominantColor() -> Color {
        Color(album.albumImage.averageColor ?? UIColor.white)
    }
}

struct ContentItemViewer_Previews: PreviewProvider {
    
    static let westWorldSeason3 = AlbumInfo(albumImage: UIImage(named: "westworld") ?? UIImage(), artist: "Ramin Djawadi", song: "Wicked Games")
    
    static let rickSanchez = AlbumInfo(albumImage: UIImage(named: "schwifty") ?? UIImage(), artist: "Rick Sanchez", song: "Schwifty")
    
    static var previews: some View {
        
        Group {
            ContentItemViewer(album: westWorldSeason3)
            ContentItemViewer(album: rickSanchez)
        }
    }
    
}
