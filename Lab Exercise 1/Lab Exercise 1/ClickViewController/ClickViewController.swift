//
//  ClickViewController.swift
//  Lab Exercise 1
//
//  Created by student on 2/22/23.
//

import UIKit

class ClickViewController : UIViewController {
    
    var food: Restaurant?
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label?.text = food?.name ?? "No Text"
        imageView?.image = UIImage(named: food?.imageName ?? "t")
    }
}
