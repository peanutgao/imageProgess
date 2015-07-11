//
//  ViewController.swift
//  图片进度条
//
//  Created by Joseph on 7/10/15.
//  Copyright © 2015 Joseph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var imageV: YSImageView!
    @IBOutlet weak var prograssSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


    }

    @IBAction func slide(sender: UISlider) {
        imageV.progress = CGFloat(sender.value)
    }
    



}



