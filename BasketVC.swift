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
    @IBOutlet weak var clearBascker: UIButton!
    
    var basketItems: [Item]!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name1.text = basketItems[basketItems.count-1].name
        count1.text = String(basketItems[basketItems.count-1].count)
        price1.text = String(basketItems[basketItems.count-1].price*basketItems[basketItems.count-1].count)
}
    @IBAction func onClearButtonClick(_ sender: Any) {
        
        name1.text = ""
        count1.text = ""
        price1.text = ""
        basketItems.removeAll()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       if let viewController = segue.destination as? ViewController{
        viewController.basketItems = self.basketItems
}
    }
}
