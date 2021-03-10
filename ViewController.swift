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
    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var guitarView: UIImageView!
    @IBOutlet weak var priceView: UILabel!
    @IBOutlet weak var namePicker: UIPickerView!
    @IBOutlet weak var buyButton: UIButton!
    var pickerData: [String] = [String]()
    var itemData: [Item] = [Item]()
    var currentItem: Item!
    var basketItems: [Item]!

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.namePicker.delegate = self
        self.namePicker.dataSource = self
        //guitarView.image = UIImage.init(named: "image-3")
        itemData = [
            Item(name: "Электрогитара", count: 1, price: 10000, picture: UIImage(named: "image-3")!),
            Item(name: "Басгитара", count: 1, price: 25000, picture: UIImage(named: "image-2")!),
            Item(name: "Акустическая гитара", count: 1, price: 50000, picture: UIImage(named: "image-1")!)]
        pickerData = ["Электрогитара", "Басгитара", "Акустическая гитара"]
        
       basketItems=itemData
    }

    @IBAction func stepperAction(_ sender: UIStepper) {
        count.text = String(Int(sender.value))
        price.text = String(currentItem.price*Int(Stepper.value))
        currentItem.count=Int(sender.value)
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
        basketVC.basketItems = self.basketItems
        
     }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        for i in itemData{
            if i.name == pickerData[row]{
                currentItem = i
            }
        }
        Stepper.value = 1
        count.text = String(Int(Stepper.value))
        /*let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency*/
        price.text = String( currentItem.price)
        priceView.text = String( currentItem.price)
        guitarView.image = currentItem.picture
        
    }
    
    @IBAction func onBuyButtonClick(_ sender: Any) {
        Stepper.value = 1
        count.text = String(Int(Stepper.value))
        price.text = String( currentItem.price)
        priceView.text = String( currentItem.price)
        
        basketItems.append(currentItem)
        
    }
    
}

class Item{
  var name: String!
  var count: Int!
  var price: Int!
    var picture: UIImage!
   
   
    init(name: String, count: Int, price: Int, picture: UIImage) {
        self.name = name
        self.count = count
        self.price = price
        self.picture = picture
    }
}


    

