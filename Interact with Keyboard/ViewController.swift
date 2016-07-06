//
//  ViewController.swift
//  Interact with Keyboard
//
//  Created by Herman Liang on 2015/6/14.
//  Copyright (c) 2015年 Herman Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak private var textBottom: UITextField!
    private var currentTextField: UITextField?
    private var isKeyboardShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(ViewController.keyboardWillShow(_:)),
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(ViewController.keyboardWillHide(_:)),
            name: UIKeyboardWillHideNotification,
            object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        currentTextField = textField
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(note: NSNotification) {
        if isKeyboardShown {
            return
        }
        if (currentTextField != textBottom) {
            return
        }
        let keyboardAnimationDetail = note.userInfo as! [String: AnyObject]
        let duration = NSTimeInterval(keyboardAnimationDetail[UIKeyboardAnimationDurationUserInfoKey]! as! NSNumber)
        let keyboardFrameValue = keyboardAnimationDetail[UIKeyboardFrameBeginUserInfoKey]! as! NSValue
        let keyboardFrame = keyboardFrameValue.CGRectValue()
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.view.frame = CGRectOffset(self.view.frame, 0, -keyboardFrame.size.height)
        })
        isKeyboardShown = true
    }
    
    func keyboardWillHide(note: NSNotification) {
        let keyboardAnimationDetail = note.userInfo as! [String: AnyObject]
        let duration = NSTimeInterval(keyboardAnimationDetail[UIKeyboardAnimationDurationUserInfoKey]! as! NSNumber)
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.view.frame = CGRectOffset(self.view.frame, 0, -self.view.frame.origin.y)
        })
        isKeyboardShown = false
    }

}

