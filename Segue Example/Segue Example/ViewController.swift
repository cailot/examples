//
//  ViewController.swift
//  Segue Example
//
//  Created by Jin Seo on 2015. 4. 16..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

var rowCounter: Int = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context:NSManagedObjectContext = appDel.managedObjectContext!
//        
//        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
//        newUser.setValue("totto", forKey: "username")
//        context.save(nil)
//        
//        println("saved")
        
        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        
        
        
        
        
        var results = context.executeFetchRequest(request, error: nil)
        
        if(results?.count > 0)
        {
            for result in results!
            {
                let name = result.valueForKey("username") as! String
                println("In DB \(name)")
                if name == "hyung"
                {
//                    context.deleteObject(result as! NSManagedObject)
//                    println("\(name) has been deleted")
                }
                 context.save(nil)
                
            }
        }else{
            println("No results")
        }
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

