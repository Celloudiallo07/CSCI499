//
//  YoutubePlayerViewController.swift
//  Meal It
//
//  Created by David Luo on 7/15/21.
//

//import UIKit
//import youtube_ios_player_helper

import UIKit
import AVKit
import youtube_ios_player_helper

class YouTubePlayerViewController: UIViewController, YTPlayerViewDelegate{

    @IBOutlet weak var loadingTF: UILabel!
    @IBOutlet var playerView: YTPlayerView!
    var videoNum: Int?
    var videos: [Video] = Bundle.main.decode("videos.json")
    var play: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        playerView.load(withVideoId: videos[videoNum!].youtube)
        loadingTF.alpha = 0
//        if(play!) {
//            loadingTF.alpha = 0
//        }
    }
    
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView, didSelectRowAt indexPath: IndexPath) {
//        play = true
        playerView.playVideo()
    }
}

