//
//  ViewController.swift
//  RxSwift Test
//
//  Created by mozeX on 07.11.2022.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var foodTableView: UITableView!
    
    let itemsFood = Observable.just([Food.init(name: "Pizza", image: "pizza"),
                                 Food.init(name: "Hamburger", image: "hamburger"),
                                 Food.init(name: "Pasta", image: "pasta"),
                                 Food.init(name: "Borsch", image: "borsch")])
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Restaurant menu"
        
        itemsFood.bind(to: foodTableView
            .rx
            .items(cellIdentifier: "newCell", cellType: FoodTableViewCell.self)) {
                (tv, item, cell) in
                cell.foodLabel.text = item.name
                cell.foodImage.image = UIImage.init(named: item.image)
            }
            .disposed(by: disposeBag)
        
        foodTableView
            .rx.modelSelected(Food.self)
            .subscribe(onNext: {
                foodObject in
                let foodVC = self.storyboard?.instantiateViewController(withIdentifier: "FoodVC") as! DetailFoodViewController
                foodVC.imgName = foodObject.image
                self.navigationController?.pushViewController(foodVC, animated: true)
            })
            .disposed(by: disposeBag)
    }


}

