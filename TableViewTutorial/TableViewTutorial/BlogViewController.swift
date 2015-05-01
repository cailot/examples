//
//  BlogViewController.swift
//  TableViewTutorial
//
//  Created by Jin Seo on 2015. 4. 28..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController {

    var blogName = String()
    
    
    
    @IBOutlet var blogNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        blogNameLabel.text = blogName
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
