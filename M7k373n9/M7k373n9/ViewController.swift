//
//  ViewController.swift
//  M7k373n9
//
//  Created by Jin Seo on 2015. 4. 11..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {

    
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
            println(textf.text)
        }))
        
        presentViewController(alertController, animated: true, completion: nil)
      
        
    }
    
    
    /*
        Add key-value into DB
    */
    @IBOutlet var addKey: UITextField!
    
    @IBOutlet var addInputValue: UITextField!
    
    @IBOutlet var addConfirmValue: UITextField!
    
    // dynamic position change for textfield in case of keyboard hiding textfield
    var activeField: UITextField?
    
    // add keyword
    @IBAction func addKeyword(sender: AnyObject)
    {
        
        addKey.delegate = self
        addInputValue.delegate = self
        addConfirmValue.delegate = self
        var value = addKey.text
        println("User inputs...  \(value)")
    }

    // cancel adding so clear textfields
    @IBAction func addCancel(sender: AnyObject)
    {
        addKey.text = ""
        addInputValue.text = ""
        addConfirmValue.text = ""
    }
    
    // disappear keyboard when clicks outside of textfield
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        addKey.resignFirstResponder()
        addInputValue.resignFirstResponder()
        addConfirmValue.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
    /*
    
    
    func registerForKeyboardNotifications()
    {
        //Adding notifies on keyboard appearing
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    func deregisterFromKeyboardNotifications()
    {
        //Removing notifies on keyboard appearing
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification)
    {
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.scrollEnabled = true
        var info : NSDictionary = notification.userInfo!
        var keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().size
        var contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeFieldPresent = activeField
        {
            if (!CGRectContainsPoint(aRect, activeField!.frame.origin))
            {
                self.scrollView.scrollRectToVisible(activeField!.frame, animated: true)
            }
        }
    */
    
    
    
    
    
    
    
    
    
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

