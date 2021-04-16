//
//  Details.swift
//  EasyChef
//
//  Created by Hasan Akoglu on 06/01/2021.
//

import SwiftUI
import AVFoundation
import AVKit
import WebKit

struct DetailsView: View {
    var title: String
    var body: some View {
        let videoView = AVPlayerView(videoURL: self.title)
            VStack(alignment: .leading) {
                videoView
                Spacer()
                Text(title)
                    .font(.largeTitle)
                Spacer()
                Text("Duration: 20 Mins")
                    .font(.title2)
                Spacer()
                Spacer()
                Text("Ingredients")
                    .font(.headline)
                List {
                    Text("ingredient")
                    Text("ingredient")
                    Text("ingredient")
                    Text("ingredient")
                    Text("ingredient")
                    Text("ingredient")
                    Text("ingredient")
                    Text("ingredient")
                    Text("ingredient")
                }
                Spacer()
        }
    }
}

struct AVPlayerView: UIViewControllerRepresentable {
    var videoURL: String?
    
    var player: AVPlayer {
        return AVPlayer(url: Bundle.main.url(forResource: videoURL, withExtension: "mov")!)
    }
    
    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        playerController.player = player
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        return AVPlayerViewController()
    }
    
    func stopVideo(){
        player.seek(to: CMTime.zero)
        player.pause()
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(title: "Chilli Sauce")
    }
}

extension AVPlayerViewController {
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.player?.seek(to: CMTime.zero)
        self.player?.pause()
        print("*** Video paused.")
    }
}
