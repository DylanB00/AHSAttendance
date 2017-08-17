//
//  AboutViewController.swift
//  AHS Attendance
//
//  Created by student on 12/7/16.
//  Copyright © 2016 Dylan Bolger. All rights reserved.
//

import Cocoa

class AboutViewController: NSViewController {

    override func viewDidAppear() {
        _ = self.view.window?.styleMask.remove(NSWindowStyleMask.resizable)
        self.view.window?.title = "About AHS Attendance"
    }
    
}
