//
//  ViewController.swift
//  TableViewTutorial
//
//  Created by Jin Seo on 2015. 4. 28..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let swiftBlogs = ["Seo", "Jin", "Hyung"]
    let textCellIdentifier = "TextCell"
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftBlogs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = swiftBlogs[row]
        return cell
    }
    
    // for delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        println(swiftBlogs[row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowBlogSegue"
        {
            if let destination = segue.destinationViewController as? BlogViewController
            {
                if let blogIndex = tableView.indexPathForSelectedRow()?.row{
                    destination.blogName = swiftBlogs[blogIndex]
                }
            }
        }
    }


}

