//
//  PlayList.swift
//  IvyPlayerMac
//
//  Created by Ivan Almada on 2/13/25.
//

import SwiftUI

struct PlayList: View {
    
    @StateObject private var viewModel = PlayerViewModel(songs: [
         Song(id: 0,
              isPlaying: false,
              isFavorite: false,
              artist: "Issey Cross",
              name: "Bittersweet Goodbye",
              filename: "Issey Cross - Bittersweet Goodbye"),
         Song(id: 1,
               isPlaying: false,
               isFavorite: false,
               artist: "Peggy Gou",
               name: "(It goes like) Nanana",
               filename: "Peggy Gou - (It Goes Like) Nanana"),
         Song(id: 2,
              isPlaying: false,
              isFavorite: false,
              artist: "Noel Gallagher's High Flying Birds",
              name: "Open the door, See what you find",
              filename: "Noel Gallagher's High Flying Birds - Open The Door, See What You Find"),
         Song(id: 3,
              isPlaying: false,
              isFavorite: false,
              artist: "Tove Lo",
              name: "Habits (Stay High) Hippie Sabotage Remix",
              filename: "Tove Lo - Habits (Stay High) - Hippie Sabotage Remix"),
         Song(id: 4,
              isPlaying: false,
              isFavorite: false,
              artist: "Jack Harlow",
              name: "Loving on me",
              filename: "Jack Harlow - Lovin On Me"),
         Song(id: 5,
              isPlaying: false,
              isFavorite: false,
              artist: "Taylor Swift",
              name: "Red",
              filename: "Taylor Swift - Red"),
         Song(id: 6,
              isPlaying: false,
              isFavorite: false,
              artist: "Benee",
              name: "Supalonely (feat Gus Dapperton",
              filename: "Benee - Supalonely"),
         Song(id: 7,
              isPlaying: false,
              isFavorite: false,
              artist: "Harry Styles",
              name: "Watermelon Sugar",
              filename: "Harry Styles - Watermelon Sugar"),
         Song(id: 8,
              isPlaying: false,
              isFavorite: false,
              artist: "The weekend & Ariadna Grande",
              name: "Save your tears for another day",
              filename: "N/A"),
         Song(id: 9,
              isPlaying: false,
              isFavorite: false,
              artist: "Ranger Trucco",
              name: "Sunday best",
              filename: "Ranger Trucco - Sunday Best")
    ])
    
    var body: some View {
        List(viewModel.songs, id: \.id) { song in
            PlayListRow(song: song, viewModel: viewModel)
        }
    }
}

#Preview {
    PlayList()
}
