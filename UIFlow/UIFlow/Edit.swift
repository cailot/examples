//
//  EditListViewController.swift
//  UIFlow
//
//  Created by Jin Seo on 2015. 4. 25..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

class Edit: UITableViewController, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet var items: UITableView!
    
    var cellContent: [String] = []
    
    
   
    @IBAction func clickDone(sender: AnyObject) {
        // navigate back to root vc
        dismissViewControllerAnimated(true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadList()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cellContent.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        var data = cellContent[indexPath.row] as String
        cell.textLabel?.text = data
        println("-->"+data)
        return cell
//
//        let cellID = "Cell"
//        var cell: UITableViewCell = items.dequeueReusableCellWithIdentifier(cellID) as! UITableViewCell
        
//        if let ip = indexPath
//        {
//            var data: NSManagedObject = NSManagedObject(cellContent[indexPath.row])
        //        }
        
//        return cell
        
    }
    
    func tableview(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println("You selected cell #\(indexPath.row)!")
    }
    
    func reloadList()
    {
        var context: NSManagedObjectContext = ViewController.returnContext()
        var request = NSFetchRequest(entityName: "Entity")
        request.returnsObjectsAsFaults = false
        var results = context.executeFetchRequest(request, error: nil)
        if(results?.count>0)
        {
            for result:AnyObject in results!
            {
                let key = result.valueForKey("name") as! String
                cellContent.append(key)
            }
        }
    }
    
    let ident = "editDetail"
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println(segue.identifier)
        if segue.identifier == ident
        {
            if let dest = segue.destinationViewController as? ItemEdit
            {
                if let index = items.indexPathForSelectedRow()?.row{
                    dest.itemValue = "ddd"
                    println(index)
                }
            }
           
            
            
            
        }
    }

}
