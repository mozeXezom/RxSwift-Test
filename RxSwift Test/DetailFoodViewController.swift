//
//  DetailFoodViewController.swift
//  RxSwift Test
//
//  Created by mozeX on 07.11.2022.
//

import UIKit

class DetailFoodViewController: UIViewController {

    @IBOutlet weak var foodImgView: UIImageView!
    
    var imgName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        foodImgView.image = UIImage.init(named: imgName)
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
