//
//  DetailViewController.swift
//  Meal It
//
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    
    @IBOutlet weak var smoothieImage : UIImageView!
    
    @IBOutlet weak var smoothieTitle : UILabel!
    
    @IBOutlet weak var mode : UILabel!
    
    @IBOutlet weak var switchTitle : UILabel!
    
    @IBOutlet weak var content : UITextView!
    
    
    var selectedRecipe : LatestMeal!
    var ingredient = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

            let node  = """
\(selectedRecipe.strIngredient1 ?? "")  \(selectedRecipe.strMeasure1 ?? "")

\(selectedRecipe.strIngredient2 ?? "")  \(selectedRecipe.strMeasure2 ?? "")

\(selectedRecipe.strIngredient3 ?? "")  \(selectedRecipe.strMeasure3 ?? "")

\(selectedRecipe.strIngredient4 ?? "")  \(selectedRecipe.strMeasure4 ?? "")

\(selectedRecipe.strIngredient5 ?? "")  \(selectedRecipe.strMeasure5 ?? "")

\(selectedRecipe.strIngredient6 ?? "")  \(selectedRecipe.strMeasure6 ?? "")

\(selectedRecipe.strIngredient7 ?? "")  \(selectedRecipe.strMeasure7 ?? "")

\(selectedRecipe.strIngredient8 ?? "")  \(selectedRecipe.strMeasure8 ?? "")

\(selectedRecipe.strIngredient9 ?? "")  \(selectedRecipe.strMeasure9 ?? "")

\(selectedRecipe.strIngredient10 ?? "")  \(selectedRecipe.strMeasure10 ?? "")

\(selectedRecipe.strIngredient11 ?? "")  \(selectedRecipe.strMeasure11 ?? "")

\(selectedRecipe.strIngredient12 ?? "")  \(selectedRecipe.strMeasure12 ?? "")

\(selectedRecipe.strIngredient13 ?? "")  \(selectedRecipe.strMeasure13 ?? "")

\(selectedRecipe.strIngredient14 ?? "")  \(selectedRecipe.strMeasure14 ?? "")

\(selectedRecipe.strIngredient15 ?? "")  \(selectedRecipe.strMeasure15 ?? "")

\(selectedRecipe.strIngredient16 ?? "")  \(selectedRecipe.strMeasure16 ?? "")

\(selectedRecipe.strIngredient17 ?? "")  \(selectedRecipe.strMeasure17 ?? "")

\(selectedRecipe.strIngredient18 ?? "")  \(selectedRecipe.strMeasure18 ?? "")

\(selectedRecipe.strIngredient19 ?? "")  \(selectedRecipe.strMeasure19 ?? "")

\(selectedRecipe.strIngredient20 ?? "")  \(selectedRecipe.strMeasure20 ?? "")

"""

            ingredient = node
      

        smoothieTitle.text = selectedRecipe.strMeal
        
        let imageurl  = URL(string: selectedRecipe.strMealThumb!)
     
        
        smoothieImage.alpha = 0
        
        UIView.animate(withDuration: 2) {
            self.smoothieImage.sd_setImage(with: imageurl, placeholderImage: UIImage(named: "logo")!, options: .progressiveLoad, progress: .none, completed: .none)
            self.smoothieImage.alpha = 1
        }
        
      
        
        content.text = ingredient
        
    }
    
    @IBAction func modeSwitch(_ sender: UISwitch) {
        
        if sender.isOn{
            
            content.text = selectedRecipe.strInstructions
            
            mode.text = "How to make it"
            switchTitle.text = "Ingredients"
        }else{
            content.text = ingredient
            mode.text = "Ingredients"
            switchTitle.text = "How to make it"
        }
    }
    
    @IBAction func backButtonAction(){
        self.navigationController?.popViewController(animated: true)
    }

}
