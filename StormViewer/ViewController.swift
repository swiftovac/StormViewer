//
//  ViewController.swift
//  StormViewer
//
//  Created by Stefan Milenkovic on 2/16/19.
//  Copyright © 2019 Stefan Milenkovic. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    var numOfPics = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                // this is the pic to load
                pictures.append(item)
                
            }
        }
        
        numOfPics = pictures.count
        pictures.sort()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            let selecetedPic = indexPath.row + 1
            let picture = pictures[indexPath.row]
            vc.selectedPicture = picture
            vc.actualPic = selecetedPic
            vc.totalPics = numOfPics
            
            navigationController?.pushViewController(vc, animated: true)
            
            
        }
        
        
    }
    
}

