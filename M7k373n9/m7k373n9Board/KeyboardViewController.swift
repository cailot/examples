//
//  KeyboardViewController.swift
//  AC Keyboard
//
//  Created by Jin Seo on 2015. 4. 6..
//  Copyright (c) 2015 Jin Seo. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var isAlphabet = true;
    var isCaps = false;
   
    @IBOutlet var firsts: [UIButton]!
    
    @IBOutlet var seconds: [UIButton]!
    
    @IBOutlet var thirds: [UIButton]!
    
    
    var first_upper = ["Q","W","E","R","T","Y","U","I","O","P"]
    
    var second_upper = ["A","S","D","F","G","H","J","K","L"]
    
    var third_upper = ["Z","X","C","V","B","N","M"]
    
    var first_lower = ["q","w","e","r","t","y","u","i","o","p"]
    
    var second_lower = ["a","s","d","f","g","h","j","k","l"]
    
    var third_lower = ["z","x","c","v","b","n","m"]
    
    var first_symbols = ["1","2","3","4","5","6","7","8","9","0"]
    
    var second_symbols = ["@","#","$","%","&","-","+","(",")"]
    
    var third_symbols = ["*","\"","^",":",";","!","?"]
    
    var first_symbols_shift = ["~","`","|","´","•","±","×","÷","{","}"]
    
    var second_symbols_shift = ["©","®","£","€","¥","=","°","[","]"]
    
    var third_symbols_shift = ["¡","<",">","¢","/","\\","¿"]
    
    
    
    
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
    ////////////////////////////////////////////
    
    // next keyboard
    @IBAction func nextKeyboardPressed(button: UIButton)
    {
        advanceToNextInputMode()
    }
    
    // caps
    @IBAction func pressCaps(button: UIButton)
    {
        isCaps = !isCaps
        displayKeys()
        
        var title = button.titleLabel!.text
        if title=="C-On"
        {
            button.setTitle("C-Off", forState: .Normal)
        }else{
            button.setTitle("C-On", forState: .Normal)
        }

    }
    
    // special chars
    @IBAction func pressSpecialChars(button: UIButton)
    {
        isAlphabet = !isAlphabet
        displayKeys()
        var title = button.titleLabel!.text
        if title=="123"
        {
            button.setTitle("ABC", forState: .Normal)
        }else{
            button.setTitle("123", forState: .Normal)
        }
    }
    
    func displayKeys()
    {
        if(isAlphabet) // alphabet
        {
            if(isCaps) // change to uppper case
            {
                for var index=0; index < firsts.count; index++
                {
                    firsts[index].setTitle(first_upper[index], forState: .Normal)
                }
                for var index=0; index < seconds.count; index++
                {
                    seconds[index].setTitle(second_upper[index], forState: .Normal)
                }
                for var index=0; index < thirds.count; index++
                {
                    thirds[index].setTitle(third_upper[index], forState: .Normal)
                }
                
            }else{ // change to lower case
                
                for var index=0; index < firsts.count; index++
                {
                    firsts[index].setTitle(first_lower[index], forState: .Normal)
                }
                for var index=0; index < seconds.count; index++
                {
                    seconds[index].setTitle(second_lower[index], forState: .Normal)
                }
                for var index=0; index < thirds.count; index++
                {
                    thirds[index].setTitle(third_lower[index], forState: .Normal)
                }
            }
        }else{ // special characters
            if(isCaps)
            {
                for var index=0; index < firsts.count; index++
                {
                    firsts[index].setTitle(first_symbols_shift[index], forState: .Normal)
                }
                for var index=0; index < seconds.count; index++
                {
                    seconds[index].setTitle(second_symbols_shift[index], forState: .Normal)
                }
                for var index=0; index < thirds.count; index++
                {
                    thirds[index].setTitle(third_symbols_shift[index], forState: .Normal)
                }
                
            }else{
                for var index=0; index < firsts.count; index++
                {
                    firsts[index].setTitle(first_symbols[index], forState: .Normal)
                }
                for var index=0; index < seconds.count; index++
                {
                    seconds[index].setTitle(second_symbols[index], forState: .Normal)
                }
                for var index=0; index < thirds.count; index++
                {
                    thirds[index].setTitle(third_symbols[index], forState: .Normal)
                }
            }
        }
    }
    
    
    
    // backspace
    @IBAction func pressBackSpace(button: UIButton)
    {
        (textDocumentProxy as! UIKeyInput).deleteBackward()
    }
    
    // space
    @IBAction func pressSpace(button: UIButton)
    {
        (textDocumentProxy as! UIKeyInput).insertText(" ")
    }
    
   
    // return
    @IBAction func pressReturn(sender: UIButton)
    {
        (textDocumentProxy as! UIKeyInput).insertText("\n")
    }

    
    
    
    
    @IBAction func keyPressed(button: UIButton)
    {
        var string = button.titleLabel!.text
        (textDocumentProxy as! UIKeyInput).insertText("\(string!)")
        // animation for pop-out effect when press keys
        UIView.animateWithDuration(0.2, animations: {
            button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2.0, 2.0)
            }, completion: {(_) -> Void in
                button.transform =
                CGAffineTransformScale(CGAffineTransformIdentity, 1, 1)
        })
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    func loadInterface()
    {
        println("started...")
        let nib = UINib(nibName: "KeyboardView5", bundle: nil)
        view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
  
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadInterface()
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
    }
    
}
