//
//  HelpViewController.swift
//  AHS Attendance
//
//  Created by student on 11/3/16.
//  Copyright © 2016 Dylan Bolger. All rights reserved.
//

import Cocoa
class SendEmailToDylan: NSObject {
    static func send() {
        let SettingsView: SettingsViewController = SettingsViewController(nibName: nil, bundle: nil)!
        let btAddr = SettingsView.blueAddr
        let service = NSSharingService(named: NSSharingServiceNameComposeEmail)!
        service.recipients = ["dylanbolg@aurorar8.org"]
        service.subject = "AHS Attendance"
        service.perform(withItems: ["[General Information, DO NOT EDIT.]\nBTADDR: " + btAddr])
    }
}
class SendEmailToPhil: NSObject {
    static func send() {
        let service = NSSharingService(named: NSSharingServiceNameComposeEmail)!
        service.recipients = ["dylanbolg@aurorar8.org"]
        service.subject = "test"
        
        service.perform(withItems: ["This is an email for auto testing through code."])
    }
}

class HelpViewController: NSViewController {
    
    
    func DisableBluetoothOn() {
        let task = Process()
        task.launchPath = "/usr/local/bin/blueutil"
        task.arguments = ["power", "0"]
        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe
        task.launch()
        task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
        print(output)
    }
    func DisableBluetoothDiscoverable() {
        let task = Process()
        task.launchPath = "/usr/local/bin/blueutil"
        task.arguments = ["discoverable", "0"]
        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe
        task.launch()
        task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
        print(output)
    }
    
    
    
    
    
    
    @IBAction func emailDylanButton(_ sender: NSButton) {
        SendEmailToDylan.send()
         
        
    }
    @IBAction func emailPhilButton(_ sender: NSButton) {
        SendEmailToPhil.send()
    }
    @IBAction func relaunchApp(_ sender: NSButton) {
        DisableBluetoothDiscoverable()
        DisableBluetoothOn()
        let fullUrl = "/" + Bundle.main.resourcePath!
        let url = URL(fileURLWithPath: fullUrl)
        let path = url.deletingLastPathComponent().deletingLastPathComponent().path
        let task = Process()
        task.launchPath = "/usr/bin/open"
        task.arguments = [path]
        task.launch()
        exit(0)
    }
    @IBOutlet var bluetoothImage: NSImageView!
    override func viewDidAppear() {
        _ = self.view.window?.styleMask.remove(NSWindowStyleMask.resizable)
        _ = self.view.window?.title = "Aurora High School Attendance Help"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["networksetup", "-getmacaddress", "en2"]
        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe
        task.launch()
        task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
        var bluetoothAddress = output
        let startIndex = bluetoothAddress.index(bluetoothAddress.startIndex, offsetBy: 18)
        let endIndex = bluetoothAddress.index(bluetoothAddress.startIndex, offsetBy: 34)
        bluetoothAddress = bluetoothAddress[startIndex...endIndex]
        
    }
}
