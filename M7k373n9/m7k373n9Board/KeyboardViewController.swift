//
//  KeyboardViewController.swift
//  AC Keyboard
//
//  Created by Jin Seo on 2015. 4. 6..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var isAlphabet = true;
    var isCaps = false;
    

    
    
    ////////////////////////////////////////////
    //      First Row
    /////////////////////////////////////////////
    
    @IBOutlet var keyQ: UIButton!
    
    @IBOutlet var keyW: UIButton!
    
    @IBOutlet var keyE: UIButton!
    
    @IBOutlet var keyR: UIButton!
    
    @IBOutlet var keyT: UIButton!
    
    @IBOutlet var keyY: UIButton!
    
    @IBOutlet var keyU: UIButton!
    
    @IBOutlet var keyI: UIButton!
   
    @IBOutlet var keyO: UIButton!
    
    @IBOutlet var keyP: UIButton!
    
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
    
    @IBOutlet var keyA: UIButton!
    
    @IBOutlet var keyS: UIButton!
    
    @IBOutlet var keyD: UIButton!
    
    @IBOutlet var keyF: UIButton!
    
    @IBOutlet var keyG: UIButton!
    
    @IBOutlet var keyH: UIButton!
    
    @IBOutlet var keyJ: UIButton!
    
    @IBOutlet var keyK: UIButton!
    
    @IBOutlet var keyL: UIButton!
    
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
    
    @IBOutlet var keyCaps: UIButton!
    
    @IBOutlet var keyZ: UIButton!
    
    @IBOutlet var keyX: UIButton!
 
    @IBOutlet var keyC: UIButton!
    
    @IBOutlet var keyV: UIButton!
    
    @IBOutlet var keyB: UIButton!
    
    @IBOutlet var keyN: UIButton!
    
    @IBOutlet var keyM: UIButton!
    
    @IBOutlet var keyDel: UIButton!
    
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
    
    // next keyboard
    @IBAction func nextKeyboardPressed(button: UIButton)
    {
        advanceToNextInputMode()
    }
    
    // caps
    @IBAction func pressCaps(button: UIButton)
    {
        for button in buttons
        {
            println(button.titleLabel!.text)
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
    
    
//    var keys: UIButton![] {return [keyQ, keyW, keyE, keyR, keyT, keyY, keyU, keyI, keyO, keyP, keyA, keyS, keyD, keyF, keyG, keyH, keyJ, keyK, keyL, keyZ, keyX, keyC, keyV, keyB, keyN, keyM] }
    
//    @IBOutlet var buttons: Array<UIButton>! = [keyQ, keyW, keyE, keyR, keyT, keyY, keyU, keyI, keyO, keyP, keyA, keyS, keyD, keyF, keyG, keyH, keyJ, keyK, keyL, keyZ, keyX, keyC, keyV, keyB, keyN, keyM]
    
    @IBOutlet var buttons: Array<UIButton>!
    
    
    
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
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadInterface()
        makeButtons()
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
