//
//  PlayerViewModel.swift
//  IvyPlayerMac
//
//  Created by Ivan Almada on 2/13/25.
//

import Combine

class PlayerViewModel: ObservableObject {
    
    private var player: Player?
    
    @Published var songs: [Song]
    
    init(songs: [Song]) {
        self.songs = songs
        self.player = Player(song: songs.first!)
    }
    
    func togglePlay(songIndex: Int) {
        self.songs[songIndex].isPlaying.toggle()
        self.player?.play()
    }
    
}
