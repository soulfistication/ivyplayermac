//
//  PlayListRow.swift
//  IvyPlayerMac
//
//  Created by Ivan Almada on 2/13/25.
//

import SwiftUI

struct PlayListRow: View {
    
    var song: Song
    
    var songIndex: Int {
        viewModel.songs.firstIndex(where: { $0.id == song.id })!
    }
    
    var viewModel: PlayerViewModel
    
    var body: some View {
        HStack {
            if song.isPlaying {
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 13))
                    .imageScale(.large)
                    .padding(.vertical)
            }
            Button("\(song.artist) - \(song.name)") {
                viewModel.togglePlay(songIndex: songIndex)
            }
        }
    }
}
