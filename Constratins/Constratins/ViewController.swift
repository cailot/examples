//
//  ViewController.swift
//  Constratins
//
//  Created by Jin Seo on 2015. 3. 29..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func buttonTapped(sender: UIButton)
    {
        if sender.titleForState(.Normal) == "X"
        {
            sender.setTitle("A very long title for this button", forState: .Normal)
        }else{
            sender.setTitle("X", forState: .Normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

