//
//  KeyboardViewController.swift
//  AC Keyboard
//
//  Created by Jin Seo on 2015. 4. 6..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    ////////////////////////////////////////////
    //      First Row
    /////////////////////////////////////////////
    
    @IBAction func pressQ(sender: UIButton) {
         keyPressed(sender)
    }
    
    @IBAction func pressW(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressE(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressR(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressT(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressY(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressU(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressI(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressO(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressP(sender: UIButton) {
        keyPressed(sender)
    }
    
    ////////////////////////////////////////////
    //      Second Row
    /////////////////////////////////////////////
    
    @IBAction func pressA(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressD(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressF(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressG(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressH(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressJ(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressK(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressL(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressS(sender: UIButton) {
        keyPressed(sender)
    }
    
    ////////////////////////////////////////////
    //      Third Row
    /////////////////////////////////////////////
    
    @IBAction func pressZ(sender: UIButton) {
        keyPressed(sender)
    }

    @IBAction func pressX(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressC(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressV(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressB(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressN(sender: UIButton) {
        keyPressed(sender)
    }
    
    @IBAction func pressM(sender: UIButton) {
        keyPressed(sender)
    }
    
    ////////////////////////////////////////////
    //      Special Keys
    /////////////////////////////////////////////
    
    @IBAction func nextKeyboardPressed(button: UIButton)
    {
        advanceToNextInputMode()
    }
    
    @IBAction func pressBackSpace(button: UIButton)
    {
        (textDocumentProxy as! UIKeyInput).deleteBackward()
    }
    
    @IBAction func pressSpace(button: UIButton)
    {
        (textDocumentProxy as! UIKeyInput).insertText(" ")
    }
    
    @IBAction func pressReturn(sender: UIButton)
    {
        (textDocumentProxy as! UIKeyInput).insertText("\n")
    }
    
    
    
    
    
    
    @IBAction func keyPressed(button: UIButton)
    {
        var string = button.titleLabel!.text
        (textDocumentProxy as! UIKeyInput).insertText("\(string!)")
    }
    
    
   override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    func loadInterface()
    {
        let nib = UINib(nibName: "KeyboardView5", bundle: nil)
        view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        makeButtons()
    }
    
    func makeButtons()
    {
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
        makeButtons()
        
        
        
        /*
    
        // Perform custom UI setup here
        
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
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
        var proxy = self.textDocumentProxy as! UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
//        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
