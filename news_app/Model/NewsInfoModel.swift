//
//  NewsInfoModel.swift
//  news_app
//
//  Created by Pavel Yarovoi on 13.07.2022.
//

import Foundation

// MARK: - NewsInfo
struct NewsInfo {
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    var countView: Int?
    
    enum CodingKeys: String, CodingKey {
        case author, title
        case counView
        case articleDescription = "description"
        case url, urlToImage, publishedAt
    }
}
