//
//  ViewController.swift
//  MusicShop2.0
//
//  Created by Кирилл Киреев on 09.03.2021.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var count: UILabel!
    
    @IBOutlet weak var guitarView: UIImageView!
    @IBOutlet weak var priceView: UILabel!
    @IBOutlet weak var namePicker: UIPickerView!
    var pickerData: [String] = [String]()
    var itemData: [Item] = [Item]()
    var currentItem: Item!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.namePicker.delegate = self
        self.namePicker.dataSource = self
        itemData = [Item(name: "Электрогитара", count: 1, price: 10000), Item(name: "Басгитара", count: 1, price: 25000), Item(name: "Акустическая гитара", count: 1, price: 50000)]
        pickerData = ["Электрогитара", "Басгитара", "Акустическая гитара"]
        
        guitarView.image = UIImage.init(named: "image-3")
    }

      // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return pickerData.count
      }
      
      // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return pickerData[row]
      }
    @IBAction func toBasket(_ sender: UIButton) {
        performSegue(withIdentifier: "toBasket", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       if let basketVC = segue.destination as? BasketVC{
        basketVC.item = currentItem
     }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        for i in itemData{
            if i.name == pickerData[row]{
                currentItem = i
            }
        }
        price.text = String(currentItem.price)
        priceView.text = String(currentItem.price)
    }
    
}

class Item{
  var name: String!
  var count: Int!
  var price: Int!
   
   
    init(name: String, count: Int, price: Int) {
      self.name = name
    self.count = count
    self.price = price
    }
}


    

