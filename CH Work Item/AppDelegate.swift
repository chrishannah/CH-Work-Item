//
//  AppDelegate.swift
//  CH Work Item
//
//  Created by Christopher Hannah on 27/12/2016.
//  Copyright © 2016 Christopher Hannah. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    // Inputs
    @IBOutlet weak var titleField: NSTextField!
    @IBOutlet weak var typeField: NSTextField!
    @IBOutlet weak var techField: NSTextField!
    @IBOutlet weak var descriptionField: NSTextField!
    @IBOutlet weak var urlField: NSTextField!
    @IBOutlet weak var imageURLField: NSTextField!
    @IBOutlet weak var titleColourWell: NSColorWell!
    @IBOutlet weak var titleBGColourWell: NSColorWell!
    @IBOutlet weak var previewField: NSTextField!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func generatePreview(_ sender: Any) {
        previewField.textColor = titleColourWell.color
        previewField.backgroundColor = titleBGColourWell.color
        previewField.stringValue = titleField.stringValue
    }
    
    @IBAction func generateHTML(_ sender: Any) {
        let titleR: Int = Int(titleColourWell.color.redComponent * 255)
        let titleG: Int = Int(titleColourWell.color.greenComponent * 255)
        let titleB: Int = Int(titleColourWell.color.blueComponent * 255)
        let titlebgR: Int = Int(titleBGColourWell.color.redComponent * 255)
        let titlebgG: Int = Int(titleBGColourWell.color.greenComponent * 255)
        let titlebgB: Int = Int(titleBGColourWell.color.blueComponent * 255)
        let outputHTML = "<div class=\"workitem\"> <h3 style=\"color: rgb(\(titleR), \(titleG), \(titleB)); background-color: rgb(\(titlebgR), \(titlebgG), \(titlebgB));\"> <a href=\"\(urlField.stringValue)\">\(titleField.stringValue)</a></h3> <p class=\"meta\"> <strong>Type: </strong> \(typeField.stringValue)<br /> <strong>Technologies Used: </strong>\(techField.stringValue)</p> <p><a href=\"\(urlField.stringValue)\"><img src=\"\(imageURLField.stringValue)\" id=\"workitemimg\"/></a></p> <p>\(descriptionField.stringValue)</p> </div>"
        
        let pasteBoard = NSPasteboard.general()
        pasteBoard.clearContents()
        pasteBoard.setString(outputHTML, forType: NSStringPboardType)
    }


}

