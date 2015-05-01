//
//  Remove.swift
//  M7k373n9
//
//  Created by Jin Seo on 2015. 4. 24..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RemoveTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var keywords: UITableView!
    
    var cellContent: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadList()
        println("table in Remove")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cellContent.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "RemoveCell")
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
//                var cell = cellContent[indexPath.row]
                var data = M7k37Util.splitByDelemeter(cellContent[indexPath.row])
                var key = data[0]
                var value = data[1]
                
//                var cellArr = split(cell) {$0 == ":"}
//                var key: String! = cellArr.count>1 ? cellArr[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) : nil
//                var value: String = cellArr[1]
                // delete DB
                deleteKeyword(key)
                
                // remove the deleted item from the model
                self.cellContent.removeAtIndex(indexPath.row)
                // remove the deleted item from the `UITableView`
                self.keywords.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
            default:
                return
            }
    }
    
    func reloadList()
    {
        var context: NSManagedObjectContext = ViewController.returnContext()
        var request = NSFetchRequest(entityName: "Keyword")
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
    
    func deleteKeyword(delete: String)
    {
        var context: NSManagedObjectContext = ViewController.returnContext()
        var request = NSFetchRequest(entityName: "Keyword")
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
                    context.save(nil)
                }
            }
        }
    }
}

