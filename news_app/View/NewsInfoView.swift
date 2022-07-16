//
//  NewsInfoView.swift
//  news_app
//
//  Created by Pavel Yarovoi on 07.07.2022.
//

import UIKit
import WebKit

class NewsInfoView: UIView {
    
    lazy var newsWebView = WKWebView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        newsWebView.frame = self.bounds
        newsWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(newsWebView)
    }

}
