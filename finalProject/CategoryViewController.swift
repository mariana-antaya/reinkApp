//
//  CategoryViewController.swift
//  finalProject
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var shopName: UITextField!
    
    @IBOutlet weak var priceAmount: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    let colors = ["Books",
                  "Equipment",
                  "Fashion", "Food", "Furniture", "Music", "Technology", "Transportation", "Travel", "Other"  ]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }


    
    @IBAction func nextTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let shopToSave = Shop(entity: Shop.entity(), insertInto: context)
            shopToSave.shop = shopName.text
            
        }
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        

    }
    


}
