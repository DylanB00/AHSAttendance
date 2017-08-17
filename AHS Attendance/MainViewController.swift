/*
 - Aurora High School Attendance Application -
 This file contains nearly all of the brains of the application.
 This file was created on October 14th, 2016 by Dylan Bolger © 2016.
 All rights reserved.
 For any questions regarding any of this document, email dylanbolg@aurorar8.org.
 First macOS application, first Xcode built application, featuring tons of repetitive lines that could more than likely be reduced, but I'm too lazy. Right?
 - Aurora High School Attendance Application -
 */
import Cocoa
import IOBluetooth
import Foundation
extension String {
    func runAsCommand() -> String {
        let pipe = Pipe()
        let task = Process()
        task.launchPath = "/bin/sh"
        task.arguments = ["-c", String(format:"%@", self)]
        task.standardOutput = pipe
        let file = pipe.fileHandleForReading
        task.launch()
        if let result = NSString(data: file.readDataToEndOfFile(), encoding: String.Encoding.utf8.rawValue) {
            return result as String
        }
        else {
            return "--- Error running command - Unable to initialize string from file data ---"
        }
    }
}
extension Date {
    func dateAt(hours: Int, minutes: Int) -> Date {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        //get the month/day/year componentsfor today's date.
        var date_components = calendar.components(
            [NSCalendar.Unit.year,
             NSCalendar.Unit.month,
             NSCalendar.Unit.day],
            from: self)
        //Create an NSDate for the specified time today.
        date_components.hour = hours
        date_components.minute = minutes
        date_components.second = 0
        let newDate = calendar.date(from: date_components)!
        return newDate }}
class MainViewController: NSViewController {
    let studentName = Host.current().localizedName
    @IBOutlet var studentNameField: NSTextField!
    @IBOutlet var currentHourField: NSTextField!
    @IBOutlet var upperStatusField: NSTextField!
    @IBOutlet var lowerStatusField: NSTextField!
    @IBOutlet var presentButton: NSButton!
    @IBOutlet var relaunchButton: NSButton!
    @IBAction func relaunchButton(_ sender: NSButton) {
        DisableBluetoothDiscoverable()
        DisableBluetoothOn()
        let fullUrl = "/" + Bundle.main.resourcePath!
        let url = URL(fileURLWithPath: fullUrl)
        let path = url.deletingLastPathComponent().deletingLastPathComponent().path
        let task = Process()
        task.launchPath = "/usr/bin/open"
        task.arguments = [path]
        task.launch()
        exit(0) }
    @IBAction func presentButton(_ sender: NSButton) {
        if currentHourField.stringValue == "1st Hour" {
            upperStatusField.stringValue = "Processing."
            let delayInSeconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                self.upperStatusField.stringValue = "Processing.."
                let delayInSeconds = 1.0
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                    self.upperStatusField.stringValue = "Processing..."
                    let delayInSeconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                        self.upperStatusField.stringValue = "Processing."
                        let delayInSeconds = 1.0
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                            self.upperStatusField.stringValue = "Processing.."
                            let delayInSeconds = 1.0
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                                self.upperStatusField.stringValue = "Processing..."
                            }
                        }
                    }
                }
            }
            let delayInSeconds2 = 8.25
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds2) {
                self.upperStatusField.stringValue = "You have been marked present for your first hour class!"
            }
        }
        if currentHourField.stringValue == "2nd Hour" {
            upperStatusField.stringValue = "Processing."
            let delayInSeconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                self.upperStatusField.stringValue = "Processing.."
                let delayInSeconds = 1.0
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                    self.upperStatusField.stringValue = "Processing..."
                    let delayInSeconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                        self.upperStatusField.stringValue = "Processing."
                        let delayInSeconds = 1.0
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                            self.upperStatusField.stringValue = "Processing.."
                            let delayInSeconds = 1.0
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                                self.upperStatusField.stringValue = "Processing..."
                        }
                    }
                }
            }
        }
            let delayInSeconds2 = 8.25
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds2) {
                self.upperStatusField.stringValue = "You have been marked present for your second hour class!"
            }
        }
        if currentHourField.stringValue == "3rd Hour" {
            upperStatusField.stringValue = "Processing."
            let delayInSeconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                self.upperStatusField.stringValue = "Processing.."
                let delayInSeconds = 1.0
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                    self.upperStatusField.stringValue = "Processing..."
                    let delayInSeconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                        self.upperStatusField.stringValue = "Processing."
                        let delayInSeconds = 1.0
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                            self.upperStatusField.stringValue = "Processing.."
                            let delayInSeconds = 1.0
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                                self.upperStatusField.stringValue = "Processing..."
                        }
                    }
                }
            }
        }
            let delayInSeconds2 = 8.25
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds2) {
                self.upperStatusField.stringValue = "You have been marked present for your third hour class!"
            }
        }
        if currentHourField.stringValue == "4th Hour" {
            upperStatusField.stringValue = "Processing."
            let delayInSeconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                self.upperStatusField.stringValue = "Processing.."
                let delayInSeconds = 1.0
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                    self.upperStatusField.stringValue = "Processing..."
                    let delayInSeconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                        self.upperStatusField.stringValue = "Processing."
                        let delayInSeconds = 1.0
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                            self.upperStatusField.stringValue = "Processing.."
                            let delayInSeconds = 1.0
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                                self.upperStatusField.stringValue = "Processing..."
                        }
                    }
                }
            }
        }
            let delayInSeconds2 = 8.25
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds2) {
                self.upperStatusField.stringValue = "You have been marked present for your fourth hour class!"
            }
        }
        if currentHourField.stringValue == "5th Hour" {
            upperStatusField.stringValue = "Processing."
            let delayInSeconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                self.upperStatusField.stringValue = "Processing.."
                let delayInSeconds = 1.0
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                    self.upperStatusField.stringValue = "Processing..."
                    let delayInSeconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                        self.upperStatusField.stringValue = "Processing."
                        let delayInSeconds = 1.0
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                            self.upperStatusField.stringValue = "Processing.."
                            let delayInSeconds = 1.0
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                                self.upperStatusField.stringValue = "Processing..."
                        }
                    }
                }
            }
        }
            let delayInSeconds2 = 8.25
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds2) {
                self.upperStatusField.stringValue = "You have been marked present for your fifth hour class!"
            }
        }
        if currentHourField.stringValue == "6th Hour" {
            upperStatusField.stringValue = "Processing."
            let delayInSeconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                self.upperStatusField.stringValue = "Processing.."
                let delayInSeconds = 1.0
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                    self.upperStatusField.stringValue = "Processing..."
                    let delayInSeconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                        self.upperStatusField.stringValue = "Processing."
                        let delayInSeconds = 1.0
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                            self.upperStatusField.stringValue = "Processing.."
                            let delayInSeconds = 1.0
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                                self.upperStatusField.stringValue = "Processing..."
                            }
                        }
                    }
                }
            }
            let delayInSeconds2 = 8.25
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds2) {
                self.upperStatusField.stringValue = "You have been marked present for your sixth hour class!"
            }
        }
        if currentHourField.stringValue == "7th Hour" {
            upperStatusField.stringValue = "Processing."
            let delayInSeconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                self.upperStatusField.stringValue = "Processing.."
                let delayInSeconds = 1.0
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                    self.upperStatusField.stringValue = "Processing..."
                    let delayInSeconds = 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                        self.upperStatusField.stringValue = "Processing."
                        let delayInSeconds = 1.0
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                            self.upperStatusField.stringValue = "Processing.."
                            let delayInSeconds = 1.0
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                                self.upperStatusField.stringValue = "Processing..."
                            }
                        }
                    }
                }
            }
            let delayInSeconds2 = 8.25
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds2) {
                self.upperStatusField.stringValue = "You have been marked present for your seventh hour class!"
            }
        }
        sender.title = "Present"
        let delayInSeconds = 9.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
        self.lowerStatusField.stringValue = "Keep this application open until your teacher says you can close it."
        }
        sender.isEnabled = false
        let delayForEnable = 2.75
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayForEnable) {
            self.EnableBluetoothOn()
            self.EnableBluetoothDiscoverable()
        }
    }
    func EnableBluetoothOn() {
        let task = Process()
        task.launchPath = "/usr/local/bin/blueutil"
        task.arguments = ["power", "1"]
        task.launch()
        task.waitUntilExit() }
    func EnableBluetoothDiscoverable() {
        let task = Process()
        task.launchPath = "/usr/local/bin/blueutil"
        task.arguments = ["discoverable", "1"]
        task.launch()
        task.waitUntilExit() }
    func DisableBluetoothOn() {
        let task = Process()
        task.launchPath = "/usr/local/bin/blueutil"
        task.arguments = ["power", "0"]
        task.launch()
        task.waitUntilExit() }
    func DisableBluetoothDiscoverable() {
        let task = Process()
        task.launchPath = "/usr/local/bin/blueutil"
        task.arguments = ["discoverable", "0"]
        task.launch()
        task.waitUntilExit() }
    override func viewDidLoad() {
        super.viewDidLoad();
        studentNameField.stringValue = studentName!
        //hour checks
        func firstHour() {
            let now = Date()
            let first_time_value = now.dateAt(hours: 7, minutes: 55)
            let second_time_value = now.dateAt(hours: 8, minutes: 41)
            if now >= first_time_value &&
                now <= second_time_value {
            currentHourField.stringValue = "1st Hour"
                upperStatusField.stringValue = "Click the button to be counted as present during this class period." } }
        func secondHour() {
            let now = Date()
            let first_time_value = now.dateAt(hours: 8, minutes: 45)
            let second_time_value = now.dateAt(hours: 9, minutes: 31)
            if now >= first_time_value &&
                now <= second_time_value {
            currentHourField.stringValue = "2nd Hour"
                upperStatusField.stringValue = "Click the button to be counted as present during this class period." } }
        func thirdHour() {
            let now = Date()
            let first_time_value = now.dateAt(hours: 9, minutes: 35)
            let second_time_value = now.dateAt(hours: 10, minutes: 21)
            if now >= first_time_value &&
                now <= second_time_value {
            currentHourField.stringValue = "3rd Hour"
                upperStatusField.stringValue = "Click the button to be counted as present during this class period." } }
        func fourthHour() {
                let now = Date()
                let first_time_value = now.dateAt(hours: 10, minutes: 25)
                let second_time_value = now.dateAt(hours: 11, minutes: 11)
                if now >= first_time_value &&
                    now <= second_time_value {
            currentHourField.stringValue = "4th Hour"
                upperStatusField.stringValue = "Click the button to be counted as present during this class period." }}
        func fifthHourFirstLunch() {
            let now = Date()
            let first_time_value = now.dateAt(hours: 11, minutes: 40)
            let second_time_value = now.dateAt(hours: 12, minutes: 30)
            if now >= first_time_value &&
                now <= second_time_value {
            currentHourField.stringValue = "5th Hour"
                upperStatusField.stringValue = "Click the button to be counted as present during this class period." }}
        func fifthHourSecondLunch() {
            let now = Date()
            let first_time_value = now.dateAt(hours: 11, minutes: 15)
            let second_time_value = now.dateAt(hours: 12, minutes: 05)
            if now >= first_time_value &&
                now <= second_time_value {
            currentHourField.stringValue = "5th Hour"
                upperStatusField.stringValue = "Click the button to be counted as present during this class period." } }
        func sixthHour() {
            let now = Date()
            let first_time_value = now.dateAt(hours: 12, minutes: 34)
            let second_time_value = now.dateAt(hours: 13, minutes: 20)
            if now >= first_time_value &&
                now <= second_time_value {
            currentHourField.stringValue = "6th Hour"
                upperStatusField.stringValue = "Click the button to be counted as present during this class period." } }
        func seventhHour() {
            let now = Date()
            let first_time_value = now.dateAt(hours: 13, minutes: 24)
            let second_time_value = now.dateAt(hours: 14, minutes: 10)
            if now >= first_time_value &&
                now <= second_time_value {
            currentHourField.stringValue = "7th Hour"
                upperStatusField.stringValue = "Click the button to be counted as present during this class period."} }
        func eighthHour() {
            let now = Date()
            let first_time_value = now.dateAt(hours: 14, minutes: 14)
            let second_time_value = now.dateAt(hours: 14, minutes: 59)
            if now >= first_time_value &&
                now <= second_time_value {
            currentHourField.stringValue = "8th Hour"
                presentButton.isEnabled = false
                upperStatusField.stringValue = "Your teacher will manually take attendance this hour."
                presentButton.toolTip = "You cannot be counted as present during eighth hour" } }
        func outOfSchoolHour() {
            let now = Date()
            let first_time_value = now.dateAt(hours: 15, minutes: 00)
            let second_time_value = now.dateAt(hours: 23, minutes: 59)
            if now >= first_time_value &&
                now <= second_time_value {
            currentHourField.stringValue = ""
                upperStatusField.stringValue = ""
                presentButton.isEnabled = false
                presentButton.toolTip = "You cannot be marked present while school is not in session" } }
        func outOfSchoolHour2() {
            let now = Date()
            let first_time_value = now.dateAt(hours: 00, minutes: 00)
            let second_time_value = now.dateAt(hours: 7, minutes: 54)
            if now >= first_time_value &&
                now <= second_time_value {
            currentHourField.stringValue = ""
                upperStatusField.stringValue = ""
                presentButton.isEnabled = false
                presentButton.toolTip = "You cannot be marked present while school is not in session" }}
        firstHour()
        secondHour()
        thirdHour()
        fourthHour()
        fifthHourFirstLunch()
        fifthHourSecondLunch()
        sixthHour()
        seventhHour()
        eighthHour()
        outOfSchoolHour()
        outOfSchoolHour2()
        if currentHourField.stringValue == "(In Between Classes)" {
            presentButton.isEnabled = false
            relaunchButton.isHidden = false
            DisableBluetoothOn()
            DisableBluetoothDiscoverable()
        }
    }
    override func viewDidAppear() {
}
}
