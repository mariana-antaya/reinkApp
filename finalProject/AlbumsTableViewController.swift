//
//  AlbumsTableViewController.swift
//  finalProject
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
    
    var toDos : [ToDo] = []
    
    var shop : Shop? = nil
    
    var identities = [String]()
    
    func createToDos() -> [ToDo] {
        
        let swift = ToDo()
        swift.name = "Books"
        
        let dog = ToDo()
        dog.name = "Equipment"
        // important is set to false by default
        let show = ToDo()
        show.name = "Fashion"
        
        let food = ToDo()
        food.name = "Food"
        
        let furn = ToDo()
        furn.name = "Furniture"
        
        let music = ToDo()
        music.name = "Music"
        
        let tech = ToDo()
        tech.name = "Technology"
        
        let trans = ToDo()
        trans.name = "Transporation"
        
        let trav = ToDo()
        trav.name = "Travel"
        
        let other = ToDo()
        other.name = "Other"
        
        return [swift, dog, show, food, furn, music, tech, trans, trav, other]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      toDos = createToDos()
        identities = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
