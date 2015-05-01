//
//  KeywordViewController.swift
//  M7k373n9
//
//  Created by Jin Seo on 2015. 4. 25..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

class KeywordViewController: UIViewController, UITextFieldDelegate {

    
    
    var editKeyHolder = String()
    var editValueHolder = String()
    var editConfirmHolder = String()
    
    @IBOutlet var editKey: UITextField!
    @IBOutlet var editValue: UITextField!
    @IBOutlet var editConfirm: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        editKey.text = editKeyHolder
        editValue.text = editValueHolder
        editConfirm.text = editConfirmHolder
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editKey.delegate = self
        editValue.delegate = self
        editValue.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editCancel"
        {
            println("I am cancelled...")
        }else if segue.identifier == "editSave"{
            var keyUI = editKey.text
            if(editValue.text==editConfirm.text)
            {
                var valueUI = editValue.text
                var context: NSManagedObjectContext = ViewController.returnContext()
                var fetchRequest = NSFetchRequest(entityName: "Keyword")
                fetchRequest.predicate = NSPredicate(format: "key = %@", keyUI!)
                if let fetchResults = context.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject]
                {
                    if fetchResults.count != 0
                    {
                        var managedObject = fetchResults[0]
                        managedObject.setValue(valueUI, forKey: "value")
                        context.save(nil)
                    }
                }
                println(keyUI! + "--->" + valueUI)
                
            }else{
                println("ConfirmValue is not identical")
            }
        
        }
        
    }
    
    // disappear keyboard when clicks outside of textfield
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        editKey.resignFirstResponder()
        editValue.resignFirstResponder()
        editConfirm.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }


    
}
