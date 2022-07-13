//
//  News.swift
//  news_app
//
//  Created by Pavel Yarovoi on 04.07.2022.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [NewsResponseInfo]?
}

// MARK: - NewsInfo
struct NewsResponseInfo: Codable {
    let source: NewsResponseSource?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - NewsSource
struct NewsResponseSource: Codable {
    let id: String?
    let name: String?
}
