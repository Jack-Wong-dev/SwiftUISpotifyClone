//
//  cellRow.swift
//  SpotifyClone
//
//  Created by Jack Wong on 5/1/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//

import SwiftUI

struct CellRow: View {
    var body: some View {
        HStack {
            Image(systemName: "timelapse")
                .padding(.trailing, 10)
            Text("title")
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding(15)
        .background(Color.black)
        .foregroundColor(.white)
    }
}

struct CellRow_Previews: PreviewProvider {
    static var previews: some View {
        CellRow()
    }
}
