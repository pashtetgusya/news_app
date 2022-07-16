//
//  NewsInfoController.swift
//  news_app
//
//  Created by Pavel Yarovoi on 07.07.2022.
//

import UIKit
import WebKit

class NewsInfoController: UIViewController, WKNavigationDelegate {
    
    lazy var newsInfoView = NewsInfoView()
    
    var newsUrlString: String = ""

    override func loadView() {
        self.view = newsInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let newsUrl = URL(string: newsUrlString) else {
            return
        }
        
        let newsUrlRequest = URLRequest(url: newsUrl)
        self.newsInfoView.newsWebView.load(newsUrlRequest)
        self.newsInfoView.newsWebView.allowsBackForwardNavigationGestures = true
    }

}
