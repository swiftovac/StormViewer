//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Stefan Milenkovic on 2/18/19.
//  Copyright © 2019 Stefan Milenkovic. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var selectedPicture: String?
    var actualPic: Int?
    var totalPics: Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let act = actualPic {
            if let tot = totalPics {
                title = "\(act) of \(tot)"
            }
        }
        
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        // Do any additional setup after loading the view.
        if let recivedImage = selectedPicture {
            imageView.image = UIImage(named: recivedImage)
        }
        
        
        
        
        
    }
    
    @objc func shareTapped() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image data")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true, completion: nil)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    
    



}
