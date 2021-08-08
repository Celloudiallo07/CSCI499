//
//  VideoPlayerViewController.swift
//  Meal It
//
//

import UIKit
import AVKit
import youtube_ios_player_helper


class VideoPlayerViewController: UIViewController, YTPlayerViewDelegate {

    
    @IBOutlet weak var playStatus : UILabel!
    
    var player = AVPlayer()
    var videoSelected: String?
    var videoTitle: String?
    var isPlay = true
    var videos: [Video] = Bundle.main.decode("videos.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(videoSelected)

        if Bundle.main.url(forResource: videoSelected, withExtension: "mp4") != nil {
          player = AVPlayer(url: Bundle.main.url(forResource: videoSelected, withExtension: "mp4")!)
            let layer = AVPlayerLayer(player: player)
            layer.frame = view.bounds
            view.layer.addSublayer(layer)
          player.play()
        }

    }
    

    @IBAction func backButtonAction(){
        player.pause()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func playButtonAction(){
        
        if isPlay{
            player.pause()
            playStatus.text = "Pause"
            isPlay = false
        }else{
            player.play()
            playStatus.text = "Play"
            isPlay = true

        }
       
    }

}
