//
//  Player.swift
//  IvyPlayerMac
//
//  Created by Ivan Almada on 2/13/25.
//

import AVFoundation

class Player: NSObject, AVAudioPlayerDelegate {
    
    private var player: AVAudioPlayer?
    
    init?(song: Song) {
        guard let url = Bundle.main.url(forResource: song.filename, withExtension: ".mp4") else {
            print("Can't load song \(song.filename)")
            return nil
        }
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
        } catch let error {
            print(String(describing: error))
        }
        super.init()
        self.player?.delegate = self
        self.player?.prepareToPlay()
    }
    
    func play() {
        guard let player else { return }
        if player.isPlaying {
            player.stop()
        } else {
            player.play()
        }
    }
}
