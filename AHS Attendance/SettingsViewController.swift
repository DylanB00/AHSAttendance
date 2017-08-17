//
//  SettingsViewController.swift
//  AHS Attendance
//
//  Created by student on 10/26/16.
//  Copyright © 2016 Dylan Bolger. All rights reserved.
//
import Cocoa
class SettingsViewController: NSViewController {
    @IBAction func dismissButton(_ sender: NSButton) {
        sender.window!.close()
    }
    
    var blueAddr = ""
    
    
    @IBOutlet var bluetoothAddressField: NSTextField!
    @IBOutlet var macOSVersion: NSTextField!
    //get student/computer name
    let studentName = Host.current().localizedName
    //show-hide bluetooth address function
    
    @IBAction func showHide(_ sender: NSButton) {
            if (bluetoothAddressField.isHidden == true) {
                sender.title = "Hide"
                bluetoothAddressField.isHidden = false
                bluetoothAddressField.toolTip = "Your computer's specifically assigned Bluetooth address"
            } else {
                sender.title = "Show"
                bluetoothAddressField.isHidden = true
        }
    }
    //start zone
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting information into place
        //get bluetooth address
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
        //defining macOS version
        let majorVersion = ProcessInfo.processInfo.operatingSystemVersion.majorVersion
        let minorVersion = ProcessInfo.processInfo.operatingSystemVersion.minorVersion
        let patchVersion = ProcessInfo.processInfo.operatingSystemVersion.patchVersion
        _ = ProcessInfo.processInfo.operatingSystemVersionString
        let macOS = (String(majorVersion) + "." + String(minorVersion) + "." + String(patchVersion))
        //setting fields
        bluetoothAddressField.stringValue = bluetoothAddress.uppercased()
        if macOS.contains("10.12") {
            macOSVersion.stringValue = macOS + " " + ("(macOS Sierra)")
        }
        if macOS.contains("10.11") {
            macOSVersion.stringValue = macOS + " " + ("(OS X El Capitan)")
        }
        blueAddr = bluetoothAddress
}
}
