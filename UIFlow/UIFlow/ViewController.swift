//
//  ViewController.swift
//  UIFlow
//
//  Created by Jin Seo on 2015. 4. 25..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    Return context for access to DB
    */
    class func returnContext() -> NSManagedObjectContext
    {
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        return context
    }


}

