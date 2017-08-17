//
//  AppDelegate.swift
//  AHS Attendance
//
//  Created by Student on 10/14/16.
//  Copyright © 2016 Dylan Bolger. All rights reserved.
//

import Cocoa
import Foundation
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet var menuBarMenu: NSMenu!
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    @IBAction func assistanceButton(_ sender: NSMenuItem) {
        
    }
    func applicationWillTerminate(_ notification: Notification) {
        DisableBluetoothDiscoverable()
        DisableBluetoothOn()
    }
    let statusItem = NSStatusBar.system().statusItem(withLength: -2)
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

    func btSettingsOpen() {
        let task = Process()
        let path = "/System/Library/PreferencePanes/Bluetooth.prefPane"
        task.launchPath = "usr/bin/open"
        task.arguments = ["-b", "com.apple.systempreferences", path]
        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe
        task.launch()
        task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
        print(output)
    }
    @IBAction func openBtSettings(_ sender: NSMenuItem) {
        btSettingsOpen()
    }
    @IBAction func relaunchApp(_ sender: NSMenuItem) {
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
    @IBAction func emailDylanButton(_ sender: NSMenuItem) {
        NSWorkspace.shared().open(NSURL(string: "https://mail.google.com/mail/u/0/?view=cm&ui=2&tf=0&fs=1&to=dylanbolg@aurorar8.org&su=AHS+Attendance+Issue&body=(Describe+your+issue+here)%0a-")! as URL)
    }
    @IBAction func emailPhilButton(_ sender: NSMenuItem) {
        NSWorkspace.shared().open(NSURL(string: "https://mail.google.com/mail/u/0/?view=cm&ui=2&tf=0&fs=1&to=psousa@aurorar8.org&su=AHS+Attendance+Issue&body=(Describe+your+issue+here)%0a-")! as URL)
    }
    
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSWorkspace.shared().extendPowerOff(by: NSIntegerMax)
        }
}

