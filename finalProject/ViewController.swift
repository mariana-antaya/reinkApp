//
//  ViewController.swift
//  finalProject
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var btnDrop: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnShow: UIButton!
    
    @IBOutlet weak var lbl: UILabel!
    var fruitList = ["Orange", "Banana", "Apple", "Blueberry", "Mango", "Cherry", "Grape", "Strawberry"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.isHidden = true
        lbl.isHidden = true
        lbl.text = "This is Simple Drop Down in which you can change according to your requirment. Dont Forget to #SUBSCRIBE #SHARE #COMMENT #LIKE"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickDropButton(_ sender: Any) {
        if tblView.isHidden {
            animate(toogle: true, type: btnDrop)
        } else {
            animate(toogle: false, type: btnDrop)
        }
        
        
    }
    @IBAction func onClickShow(_ sender: Any) {
        if lbl.isHidden {
            animate(toogle: true, type: btnShow)
        } else {
            animate(toogle: false, type: btnShow)
        }
    }
    
    func animate(toogle: Bool, type: UIButton) {
        
        if type == btnDrop {
            
            if toogle {
                UIView.animate(withDuration: 0.3) {
                    self.tblView.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.tblView.isHidden = true
                }
            }
        } else {
            if toogle {
                UIView.animate(withDuration: 0.3) {
                    self.lbl.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.lbl.isHidden = true
                }
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruitList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnDrop.setTitle("\(fruitList[indexPath.row])", for: .normal)
        animate(toogle: false, type: btnDrop)
    }
    
    
}

