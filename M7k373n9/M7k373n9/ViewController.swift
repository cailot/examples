//
//  ViewController.swift
//  M7k373n9
//
//  Created by Jin Seo on 2015. 4. 11..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet
    var tableView: UITableView!
    var items: [String] = ["List", "Add", "Edit", "Remove", "Master"]
    
    // DB connection
    var context: NSManagedObjectContext? = nil
    
    // return total num of items
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // create cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    // handle cell selection
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell#\(indexPath.row)")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbInitialise()
        
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
        
        
        
        var v:UIView = UIView(frame: CGRectZero)
        v.backgroundColor = UIColor.clearColor()
        tableView.tableFooterView = v
        tableView.tableHeaderView = v
        
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

