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

    @IBOutlet var listButton: UIButton!
    
    @IBOutlet var addButton: UIButton!
    
    @IBOutlet var editButton: UIButton!
    
    @IBOutlet var removeButton: UIButton!
    
    static var isActive : Bool = false
    
    // unwind segue ???
    
    
    /*
        Checks whether Master PIN is right or not.
    */
    
    @IBAction func pressMasterInput(sender: AnyObject) 
    {
        
        
        let alertController = UIAlertController(title: "Please Enter Master PIN", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Name"
            textField.secureTextEntry = true
            textField.keyboardType = .NumberPad
        })
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: {
            action in
                println("Dismiss")
            }))
        
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {
            (alertAction:UIAlertAction!) in
            let textf = alertController.textFields?[0] as! UITextField
            if textf.text=="1234"
            {
                self.enableButtons()
                ViewController.isActive = true
            }
            println(textf.text)
        }))
        
        presentViewController(alertController, animated: true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(ViewController.isActive)
        {
            enableButtons()
        }else{
            disableButtons()
        }
        println("Main - viewDidLoad  \(ViewController.isActive)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "list"
        {
            println("prepareForSegue - list")
        }else{
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func enableButtons()
    {
        self.listButton.enabled = true
        self.addButton.enabled = true
        self.editButton.enabled = true
        self.removeButton.enabled = true
    }
    
    func disableButtons()
    {
        self.listButton.enabled = false
        self.addButton.enabled = false
        self.editButton.enabled = false
        self.removeButton.enabled = false
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

