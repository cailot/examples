//
//  ItemEdit.swift
//  UIFlow
//
//  Created by Jin Seo on 2015. 4. 25..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

class ItemEdit: UIViewController {

    @IBOutlet var field: UITextField!
    
    var itemValue = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        field.text = "aaaa"
    }
}
