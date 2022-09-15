//
//  ViewController.swift
//  IAmPoor
//
//  Created by Jun Guo on 2022-09-15.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageButton: UIButton!
    var imageName: String = "emerald"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func onClick(_ sender: UIButton) {
        if imageName == "emerald" {
            imageName = "sapphire"
        }else{
            imageName = "emerald"
        }
            
        imageButton.setBackgroundImage(UIImage(imageLiteralResourceName: imageName), for: .normal)
    
    }
    
}

