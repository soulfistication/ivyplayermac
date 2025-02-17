//
//  PlayerViewModel.swift
//  IvyPlayerMac
//
//  Created by Ivan Almada on 2/13/25.
//

import AVFAudio
import Combine

class PlayerViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
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
                player = Player(song: song, delegate: self)
                player?.play()
                self.playingSongIndex = songIndex
                self.playingSong = song
            }
        } else {
            songs[songIndex].isPlaying = true
            playingSongIndex = songIndex
            let song = songs[songIndex]
            playingSong = song
            player = Player(song: song, delegate: self)
            player?.play()
        }
    }
    
    // MARK: - AVAudioPlayerDelegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        guard let playingSongIndex else { return }
        songs[playingSongIndex].isPlaying = false
        self.playingSongIndex = nil
        self.playingSong = nil
    }
}
