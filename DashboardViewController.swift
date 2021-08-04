//
//  DashboardViewController.swift
//  Meal It
//
//

import UIKit
import SDWebImage

class DashboardViewController: UIViewController {

    
    
    @IBOutlet  weak var collectionView : UICollectionView!
    @IBOutlet weak var dashBoardTableView : UITableView!
    
    
    var VM = ApiViewModel()
    var allRecipe : Meals?
    var recommendedRecipe : Catergories?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        
        
        dashBoardTableView.delegate = self
        dashBoardTableView.dataSource = self
        dashBoardTableView.reloadData()
        
        
        
        
        
        VM.GetMeals { status, Result, Error in
            if status{
                
                print(Result)
                self.allRecipe = Result
//                self.collectionView.reloadData()
                
                DispatchQueue.main.async  {
                    self.dashBoardTableView.reloadData()

                }
            }
        }
        
        VM.GetCatergories{ status, Result, Error in
            if status{
                
                print(Result)
                self.recommendedRecipe = Result
                
                
                DispatchQueue.main.async  {
                    self.self.collectionView.reloadData()

                }
            }
        }

    }
    

    @IBAction func onClickTabBar(_ sender: UIButton){
        
        let tag = sender.tag
        
        if tag == 1{
            tabBarController?.selectedIndex = 4
        }
        
        else if tag == 2{
            tabBarController?.selectedIndex = 0
        }
        
        else if tag == 3{
            tabBarController?.selectedIndex = 1        }

        else if tag == 4{
            tabBarController?.selectedIndex = 2
        }
        
        else if tag == 0{
            tabBarController?.selectedIndex = 3
        }
    }
    
    
 

}


extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendedRecipe?.meals?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Recommend", for: indexPath) as! RecommendationCollectionViewCell
        
        cell.Title.text = recommendedRecipe?.meals![indexPath.row].strCategory
        
        return cell
    }
    
}



extension DashboardViewController  : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRecipe?.meals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Dashboard", for: indexPath) as! MealItTableViewCell
        
        
        cell.Title.alpha = 0
        
        UIView.animate(withDuration: 2) {
            cell.Title.text = self.allRecipe?.meals![indexPath.row].strMeal
            cell.Title.alpha = 1
        }
       
        
        
        let imageurl  = URL(string: allRecipe?.meals![indexPath.row].strMealThumb ?? "")
     
        cell.smoothieImage.sd_setImage(with: imageurl, placeholderImage: UIImage(named: "logo")!, options: .progressiveLoad, progress: .none, completed: .none)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
      
    }
}
