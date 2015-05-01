//
//  Add.swift
//  M7k373n9
//
//  Created by Jin Seo on 2015. 4. 24..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class AddTableViewController: UIViewController, UITextFieldDelegate
{
    
    /*
     * vars to link from UI
    */
    @IBOutlet var addKey: UITextField!
    
    @IBOutlet var addInputValue: UITextField!
    
    @IBOutlet var addConfirmValue: UITextField!
    
    var kbHeight: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKey.delegate = self
        addInputValue.delegate = self
        addConfirmValue.delegate = self
    }
    
    func animateTextField(up: Bool) {
        var movement = (up ? -kbHeight : kbHeight)
        
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        })
    }
    
    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                kbHeight = keyboardSize.height
                self.animateTextField(true)
            }
            
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(false)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    func cleanupFields()
    {
        addKey.text = ""
        addInputValue.text = ""
        addConfirmValue.text = ""
    }
    
    // add info into DB
    func addKeyword(key: String, value: String)
    {
        var context: NSManagedObjectContext = ViewController.returnContext()
        var entry = NSEntityDescription.insertNewObjectForEntityForName("Keyword", inManagedObjectContext: context) as! NSManagedObject
        entry.setValue(key, forKey: "key")
        entry.setValue(value, forKey: "value")
        context.save(nil)
        println(key + "--->" + value)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cancelFromAdd"
        {
            cleanupFields()
            println("I am cancelled...")
        }else if segue.identifier == "saveFromAdd"{
            var keyUI = addKey.text
            if(addInputValue.text==addConfirmValue.text)
            {
                var valueUI = addInputValue.text
                addKeyword(keyUI, value: addInputValue.text)
                println("Key ...  \(keyUI) and Value .... \(addInputValue.text)")
                cleanupFields()
            }else{
                println("ConfirmValue is not identical")
            }
            
        }
        
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
    
    
}