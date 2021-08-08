//
//  VideoViewController.swift
//  Meal It
//
//

import UIKit

class VideoViewController: UIViewController {

    @IBOutlet weak var videoTableView : UITableView!
    
    var videos: [Video] = Bundle.main.decode("videos.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.isHidden = true
        
        
        videoTableView.delegate = self
        videoTableView.dataSource = self
        videoTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickTabBar(_ sender: UIButton){
        
        let tag = sender.tag
        
        if tag == 1{
         
            tabBarController?.selectedIndex = 0
        }
        
        else if tag == 2{
            tabBarController?.selectedIndex = 1
        }
        
        else if tag == 3{
            tabBarController?.selectedIndex = 2
        }

        else if tag == 0{
            tabBarController?.selectedIndex = 3
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension VideoViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VDO", for: indexPath) as! VideoTableViewCell
        
        cell.smoothieImage.image = UIImage(named: videos[indexPath.row].id)
        cell.time.text = videos[indexPath.row].headline
        cell.title.text = videos[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 215
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Player") as! VideoPlayerViewController
        
        let vc = storyboard?.instantiateViewController(identifier: "YoutubePlayer") as! YouTubePlayerViewController
        vc.videoNum = index
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated:true)
//        vc.videoSelected = videos[index].id
//        vc.videoTitle = videos[index].name
        
        
//        self.navigationController?.pushViewController(vc, animated: true)

    }
}
