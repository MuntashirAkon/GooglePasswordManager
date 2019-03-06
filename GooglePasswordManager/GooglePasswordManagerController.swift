//
//  GooglePasswordManagerController.swift
//  GooglePasswordManager
//
//  Created by Muntashir Al-Islam on 06/03/2019.
//  Copyright © 2019 Muntashir Al-Islam. All rights reserved.
//

import Cocoa
import WebKit

class GooglePasswordManagerController: NSViewController {
    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://passwords.google.com")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    override func viewDidAppear() {
        NSApplication.shared.activate(ignoringOtherApps: true)
    }
}


extension GooglePasswordManagerController {
    static func freshController() -> GooglePasswordManagerController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "GooglePasswordManager")
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? GooglePasswordManagerController else {
            fatalError("Cannot Find GooglePasswordManager!")
        }
        viewcontroller.loadView()
        return viewcontroller
    }
}
