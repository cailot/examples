//
//  ViewController.swift
//  M7k373n9
//
//  Created by Jin Seo on 2015. 4. 11..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

var showList = false

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    
    // unwind segue ???
    
    
    @IBOutlet var keywords: UITableView!
    
    var cellContent: [String] = []
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cellContent.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContent[indexPath.row] as String
        return cell
    }
    
    func tableview(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println("You selected cell #\(indexPath.row)!")
    }
    
    
    // called when a row deletion action is confirmed
    
    func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            switch editingStyle {
            case .Delete:
                
                
                var cell = cellContent[indexPath.row]
                var cellArr = split(cell) {$0 == ":"}
                var key: String! = cellArr.count>1 ? cellArr[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) : nil
                var value: String = cellArr[1]
                // delete DB
//                println("\(indexPath.row) --- \(cell) -----\(key)--")
                deleteKeyword(key)

                // remove the deleted item from the model
                self.cellContent.removeAtIndex(indexPath.row)
                // remove the deleted item from the `UITableView`
                self.keywords.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
            default:
                return
            }
    }
    
    
    
    
    
    
    
    /*
        Return context for access to DB
    */
    func returnContext() -> NSManagedObjectContext
    {
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        return context
    }
    
    
    
   

    
    
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
        if(addInputValue.text==addConfirmValue.text)
        {
            addKeyword(addKey.text, value: addInputValue.text)
           println("Key ...  \(value) and Value .... \(addInputValue.text)")
        }else{
          println("ConfirmValue is not identical")
        }
        
    }
    
    // add info into DB
    func addKeyword(key: String, value: String)
    {
        var context: NSManagedObjectContext = returnContext()
        var entry = NSEntityDescription.insertNewObjectForEntityForName("Keywords", inManagedObjectContext: context) as! NSManagedObject
        entry.setValue(key, forKey: "key")
        entry.setValue(value, forKey: "value")
        context.save(nil)
        println(key + "--->" + value)
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
    
    
    
    
    
    
    
    
    
    // DB connection
    var context: NSManagedObjectContext? = nil
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbInitialise()
        tableInitialise()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dbInitialise()
    {
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDel.managedObjectContext!
    }
    
    
    func tableInitialise()
    {
        println("tableInitialised()")
        reloadList()
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "list"
        {
            showList = true
            println("prepareForSegue - list")
        }else{
            showList = false
        }
    }
    
    
    
    
    
    func reloadList()
    {
        if(showList)
        {
            var context: NSManagedObjectContext = returnContext()
            var request = NSFetchRequest(entityName: "Keywords")
            request.returnsObjectsAsFaults = false
            var results = context.executeFetchRequest(request, error: nil)
            if(results?.count>0)
            {
                for result:AnyObject in results!
                {
                    let key = result.valueForKey("key") as! String
                    let value = result.valueForKey("value") as! String
                    var item = key + " : " + value
                    cellContent.append(item)
                }
            }
        }
        println("display \(showList)")
    }
    
    func deleteKeyword(delete: String)
    {
        var context: NSManagedObjectContext = returnContext()
        var request = NSFetchRequest(entityName: "Keywords")
        request.returnsObjectsAsFaults = false
        var results = context.executeFetchRequest(request, error: nil)
        if(results?.count>0)
        {
            for result:AnyObject in results!
            {
                let key = result.valueForKey("key") as! String
                if key == delete
                {
                    context.deleteObject(result as! NSManagedObject)
                    println(key + " has been deleted")
                }
                
                
//                let value = result.valueForKey("value") as! String
//                var item = key + " : " + value
//                cellContent.append(item)
            }
        }
        println("display \(showList)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

