//
//  basketVC.swift
//  MusicShop2.0
//
//  Created by Кирилл Киреев on 09.03.2021.
//

import UIKit

class BasketVC: UIViewController {
   
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var count1: UILabel!
    @IBOutlet weak var price1: UILabel!
    
    var item: Item!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name1.text = item.name
        count1.text = String(item.count)
        price1.text = String(item.price)
}
}
