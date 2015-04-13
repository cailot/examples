//
//  ViewController.swift
//  Example App
//
//  Created by Jin Seo on 2015. 3. 15..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var age: UITextField!
    @IBAction func buttonPressed(sender: AnyObject) {
        
        myLabel.text = "tapped...."
        var input = age.text.toInt()
        
        if(input==nil)
        {
            finalAge.text = "Please input your age"
            
        }else{
        
        println(input)
        
        finalAge.text = "Your cat is \(input! * 7)"
        age.text = ""
        }
        
        
    }
    
    @IBOutlet weak var finalAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        myLabel.text = "It worked ~~~"
        
        println("Started...")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

