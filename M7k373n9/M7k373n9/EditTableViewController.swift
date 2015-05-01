//
//  EditTableViewController.swift
//  M7k373n9
//
//  Created by Jin Seo on 2015. 4. 25..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

class EditTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet var tableView: UITableView!
    var cellContent: [String] = []
    
    let textCellIdentifier = "EditCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        reloadList()
        println("tableInitialised()")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cellContent.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = cellContent[row]
        return cell
    }
    
    // for delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        println(cellContent[row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editSegue"
        {
            if let destination = segue.destinationViewController as? KeywordViewController
            {
                if let cellIndex = tableView.indexPathForSelectedRow()?.row{
                    
                    var data = M7k37Util.splitByDelemeter(cellContent[cellIndex])
                    destination.editKeyHolder = data[0]
                    destination.editValueHolder = data[1]
                    destination.editConfirmHolder = data[1]
                }
            }
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

}
