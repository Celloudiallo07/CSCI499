//
//  FavouriteViewController.swift
//  Meal It
//
//

import UIKit
import SDWebImage

class LatestViewController: UIViewController {

    
    
    @IBOutlet weak var LatestTableView : UITableView!
    
    var latestList : Latest?
    
    var VM = ApiViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.isHidden = true
        
        LatestTableView.delegate = self
        LatestTableView.dataSource = self
        LatestTableView.reloadData()
       
        
        VM.Getlatest{ status, Result, Error in
            if status{
                
                print(Result)
                self.latestList = Result
//                self.collectionView.reloadData()
                
                DispatchQueue.main.async  {
                    self.LatestTableView.reloadData()

                }
            }
        }

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


extension LatestViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return latestList?.meals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAV", for: indexPath) as! MealItTableViewCell
        
        
        cell.Title.text = latestList?.meals![indexPath.row].strMeal
        let imageurl  = URL(string: (latestList?.meals![indexPath.row].strMealThumb)!)
     
        cell.smoothieImage.sd_setImage(with: imageurl, placeholderImage: UIImage(named: "logo")!, options: .progressiveLoad, progress: .none, completed: .none)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(identifier: "Detail") as! DetailViewController
        vc.selectedRecipe = latestList?.meals![indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
