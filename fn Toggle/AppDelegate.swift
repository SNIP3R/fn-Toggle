//
//  AppDelegate.swift
//  fn Toggle
//
//  Created by John Groenhof on 12/20/15.
//  Copyright © 2015 Spiraal. All rights reserved.
//

import Cocoa
import Foundation


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        let icon = NSImage(named: "statusIcon")
        icon!.template = true
        
        statusItem.image = icon
        statusItem.menu = statusMenu
        
    }


    // "Toggle fn" menuItem
    @IBAction func menuClicked(sender: NSMenuItem) {
        
        // Launches OSASCRIPT and runs fnToggle script file
        let task = NSTask()
        task.launchPath = "/usr/bin/osascript"
        task.arguments = ["/Users/John/fnToggle.scpt"]
        
        task.launch()
        
    }
    
    
    // "Quit" menuItem
    @IBAction func menuQuit(sender: AnyObject) {
        
        NSApplication.sharedApplication().terminate(self)
        
    }
   
}



/*

    AppleScript code in fnToggle.scpt:
    
    tell application "System Preferences"
        reveal anchor "keyboardTab" of pane "com.apple.preference.keyboard"
    end tell
    tell application "System Events" to tell process "System Preferences"
        click checkbox 1 of tab group 1 of window 1
    end tell
    quit application "System Preferences"


    from:
         http://apple.stackexchange.com/questions/59178/toggle-use-all-f1-f2-as-standard-keys-via-script


*/






