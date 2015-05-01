//
//  List.swift
//  M7k373n9
//
//  Created by Jin Seo on 2015. 4. 24..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var keywords: UITableView!
    
    var cellContent: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadList()
        println("tableInitialised()")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cellContent.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ListCell")
        cell.textLabel?.text = cellContent[indexPath.row] as String
        return cell
    }
    
    func tableview(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println("You selected cell #\(indexPath.row)!")
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
}

