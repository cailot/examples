//
//  Add.swift
//  UIFlow
//
//  Created by Jin Seo on 2015. 4. 25..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Add: ResponsiveTextFieldViewController, UITextFieldDelegate {
    
    
    @IBOutlet var field: UITextField!
    
 // disappear keyboard when clicks outside of textfield
func textFieldShouldReturn(textField: UITextField) -> Bool
{
    field.resignFirstResponder()
    return true;
}

override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    self.view.endEditing(true)
}
    
    
    
    
    
    
    
    
    @IBAction func clickSave(sender: AnyObject) {
        var context: NSManagedObjectContext = ViewController.returnContext()
        var entry = NSEntityDescription.insertNewObjectForEntityForName("Entity", inManagedObjectContext: context) as! NSManagedObject
        var key = field.text
        entry.setValue(key, forKey: "name")
        context.save(nil)
        println(key + "---> saved !!!")
        
        // navigate back to root vc
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelSave(sender: AnyObject) {
        // navigate back to root vc
        dismissViewControllerAnimated(true, completion: nil)
    }

}