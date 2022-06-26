//
//  AboutViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 26.06.2022.
//

import UIKit
import WebKit

class AboutViewController: UIViewController, Storyboarded, WKNavigationDelegate {
    
    var coordinator: AboutCoordinator?
    var didSendEventClosure: ((AboutViewController.Event) -> Void)?
    var edit = false
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "О хакатоне"
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let url = URL(string: "https://hackathon.iteventsbrn.ru")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

}

extension AboutViewController {
    enum Event {
        case about
    }
}
