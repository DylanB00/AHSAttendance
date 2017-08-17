//
//  LoginViewController.swift
//  AHS Attendance
//
//  Created by student on 11/30/16.
//  Copyright © 2016 Dylan Bolger. All rights reserved.
//

import Cocoa
import Foundation
class LoginViewController: NSViewController {
    
    

 
    func checkLogin() {
        let keyValues = ["test":"test"]
        for (key,value) in keyValues
        {
            if (key == userNameField.stringValue && value == passwordField.stringValue)
            {
                statusField.textColor = NSColor.black
                statusField.stringValue = "zz"
            }
            else {
                statusField.textColor = NSColor.red
                statusField.stringValue = "Invalid Credentials"
                let numberOfShakes:Int = 5
                let durationOfShake:Float = 0.5
                let vigourOfShake:Float = 0.05
                
                let frame:CGRect = (self.view.window!.frame)
                let shakeAnimation = CAKeyframeAnimation()
                
                let shakePath = CGMutablePath()
                shakePath.move(to: CGPoint(x: NSMinX(frame), y: NSMinY(frame)))
                
                for _ in 1...numberOfShakes {
                    shakePath.addLine(to: CGPoint(x:NSMinX(frame) - frame.size.width * CGFloat(vigourOfShake), y: NSMinY(frame)))
                    shakePath.addLine(to: CGPoint(x:NSMinX(frame) + frame.size.width * CGFloat(vigourOfShake), y: NSMinY(frame)))
                }
                
                shakePath.closeSubpath()
                shakeAnimation.path = shakePath
                shakeAnimation.duration = CFTimeInterval(durationOfShake)
                self.view.window?.animations = ["frameOrigin":shakeAnimation]
                self.view.window?.animator().setFrameOrigin((self.view.window?.frame.origin)!)
            }
        }
    }
    @IBOutlet var userNameField: NSTextField!
    @IBOutlet var passwordField: NSSecureTextField!
    @IBOutlet var statusField: NSTextField!
    @IBAction func confirmButton(_ sender: NSButton) {
        checkLogin()
        
        if statusField.textColor == NSColor.black {
        }
        else {
            
        }
        }
    @IBAction func cancelButton(_ sender: NSButton) {
        
        
        self.view.window?.close()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusField.stringValue = ""
    
        
    }
    
}
