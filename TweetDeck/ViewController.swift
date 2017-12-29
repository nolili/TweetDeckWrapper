//
//  ViewController.swift
//  TweetDeck
//
//  Created by nori on 2017/12/27.
//  Copyright © 2017年 nori. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKUIDelegate {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let req = URLRequest(url: URL(string: "https://tweetdeck.twitter.com")!)
        webView.load(req)
        webView.uiDelegate = self
    }
    
    func webView(_ webView: WKWebView, runOpenPanelWith parameters: WKOpenPanelParameters, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping ([URL]?) -> Void) {
        let openFileDialog = NSOpenPanel()
        if openFileDialog.runModal().rawValue == NSApplication.ModalResponse.OK.rawValue {
        guard let fileURL = openFileDialog.url else { return }
        completionHandler([fileURL])
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

