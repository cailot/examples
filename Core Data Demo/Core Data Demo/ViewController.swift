//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Jin Seo on 2015. 4. 16..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appDel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
//        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        
//        newUser.setValue("Jin", forKey: "username")
//        newUser.setValue("1234", forKey: "password")
        
        context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        var results = context.executeFetchRequest(request, error: nil)
        
//        println(results)
        if(results?.count > 0)
        {
        
        for result: AnyObject in results!
        {
            println(result.password)
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

