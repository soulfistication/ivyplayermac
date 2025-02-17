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
    
    private var playingSongIndex: Int?
    
    private var playingSong: Song?
    
    init(songs: [Song]) {
        self.songs = songs
    }
    
    func play(songIndex: Int) {
        if let playingSongIndex {
            if playingSongIndex == songIndex {
                player?.stop()
                songs[playingSongIndex].isPlaying = false
                self.playingSongIndex = nil
                self.playingSong = nil
            } else {
                songs[playingSongIndex].isPlaying = false
                player?.stop()
                let song = songs[songIndex]
                songs[songIndex].isPlaying = true
                player = Player(song: song)
                player?.play()
                self.playingSongIndex = songIndex
                self.playingSong = song
            }
        } else {
            songs[songIndex].isPlaying = true
            playingSongIndex = songIndex
            let song = songs[songIndex]
            playingSong = song
            player = Player(song: song)
            player?.play()
        }
    }
}
