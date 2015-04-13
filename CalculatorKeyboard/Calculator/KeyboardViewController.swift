//
//  KeyboardViewController.swift
//  Calculator
//
//  Created by Jin Seo on 2015. 3. 29..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

   var calculatorView: UIView!

    @IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var display: UILabel!
    
    
//    let buttonTitles = ["0","1","2","3","4","5"]
    
    
    
    var shouldClearDisplayBeforeInserting = true
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }
    
    
    
    func loadInterface()
    {
        // load the nib file
        var calculatorNib = UINib(nibName: "Calculator", bundle: nil)
        // instantiate the view
        calculatorView = calculatorNib.instantiateWithOwner(self, options: nil)[0] as UIView
        // add the inferface to the main view
        view.addSubview(calculatorView)
        // copy the background color
        view.backgroundColor = calculatorView.backgroundColor
        
        // next keyboard button
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        // clear button
        clearButton.addTarget(self, action: "clearDisplay", forControlEvents: .TouchUpInside)
    }
    
    @IBAction func clearDisplay()
    {
        display.text = "0"
        shouldClearDisplayBeforeInserting = true
    }
    
    
    @IBAction func disTapNumber(number: UIButton)
    {
        if shouldClearDisplayBeforeInserting
        {
            display.text = ""
            shouldClearDisplayBeforeInserting = false
        }
        if var numberAsString = number.titleLabel?.text
        {
            var numberAsNSString = numberAsString as NSString
            if var oldDisplay = display?.text!
            {
                display.text = "\(oldDisplay)\(numberAsNSString.intValue)"
            }else{
                display.text = "\(numberAsNSString.intValue)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
        clearDisplay()
    
        /*
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
