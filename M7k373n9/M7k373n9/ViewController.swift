//
//  ViewController.swift
//  M7k373n9
//
//  Created by Jin Seo on 2015. 4. 11..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBAction func pressMasterInput(sender: AnyObject)
    {
        let alertController = UIAlertController(title: "Jin", message: "Hi Jihoo, How are you, today?", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    // DB connection
    var context: NSManagedObjectContext? = nil
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbInitialise()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dbInitialise()
    {
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDel.managedObjectContext!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

