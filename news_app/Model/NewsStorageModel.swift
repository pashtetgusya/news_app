//
//  NewsStorageModel.swift
//  news_app
//
//  Created by Pavel Yarovoi on 08.07.2022.
//

import Foundation

protocol newsStorageProtocol {
    func loadNewsWithStorage() -> [NewsInfo]
    func saveNewsInStorage(news: [NewsResponseInfo])
}

class NewsStorage: newsStorageProtocol {
    
    private var newsStorage = UserDefaults.standard
    private var newsStorageKey = "newsData"
    
    private enum NewsKey: String {
        case newsAuthor
        case newsTitle
        case newsDescription
        case newsUrl
        case newsUrlToImage
        case newsPublishedAt
        case newsCounView
    }
    
    func loadNewsWithStorage() -> [NewsInfo] {
        let newsFromStorage = newsStorage.array(forKey: newsStorageKey) as? [[String: Any]] ?? []
        var resultNews: [NewsInfo] = []
        
        for news in newsFromStorage {
            guard let newsAuthor = news[NewsKey.newsAuthor.rawValue],
                  let newsTitle = news[NewsKey.newsTitle.rawValue],
                  let newsDescription = news[NewsKey.newsDescription.rawValue],
                  let newsUrl = news[NewsKey.newsUrl.rawValue],
                  let newsUrlToImage = news[NewsKey.newsUrlToImage.rawValue],
                  let newsPublishedAt = news[NewsKey.newsPublishedAt.rawValue],
                  let newsCountView = news[NewsKey.newsCounView.rawValue] else {
                continue
            }
        
            resultNews.append(NewsInfo(
                author: newsAuthor as? String,
                title: newsTitle as? String,
                articleDescription: newsDescription as? String,
                url: newsUrl as? String,
                urlToImage: newsUrlToImage as? String,
                publishedAt: newsPublishedAt as? String,
                countView: newsCountView as? Int
                )
            )
        }
        
        return resultNews
    }
    
    func saveNewsInStorage(news: [NewsResponseInfo]) {
        var arrayNewsForStorage: [[String:Any]] = []
        
        news.forEach { news in
            var newNewsForStorage: Dictionary<String, Any> = [:]
            
            newNewsForStorage[NewsKey.newsAuthor.rawValue] = news.author
            newNewsForStorage[NewsKey.newsTitle.rawValue] = news.title
            newNewsForStorage[NewsKey.newsDescription.rawValue] = news.articleDescription
            newNewsForStorage[NewsKey.newsUrl.rawValue] = news.url
            newNewsForStorage[NewsKey.newsUrlToImage.rawValue] = news.urlToImage
            newNewsForStorage[NewsKey.newsPublishedAt.rawValue] = news.publishedAt
            newNewsForStorage[NewsKey.newsCounView.rawValue] = 0
            
            arrayNewsForStorage.append(newNewsForStorage)
        }
        
        newsStorage.set(arrayNewsForStorage, forKey: newsStorageKey)
    }
    
    func updateNewsInStorage(news: [NewsInfo]) {
        var arrayNewsForStorage: [[String:Any]] = []
        
        news.forEach { news in
            var newNewsForStorage: Dictionary<String, Any> = [:]
            
            newNewsForStorage[NewsKey.newsAuthor.rawValue] = news.author
            newNewsForStorage[NewsKey.newsTitle.rawValue] = news.title
            newNewsForStorage[NewsKey.newsDescription.rawValue] = news.articleDescription
            newNewsForStorage[NewsKey.newsUrl.rawValue] = news.url
            newNewsForStorage[NewsKey.newsUrlToImage.rawValue] = news.urlToImage
            newNewsForStorage[NewsKey.newsPublishedAt.rawValue] = news.publishedAt
            newNewsForStorage[NewsKey.newsCounView.rawValue] = 0
            
            arrayNewsForStorage.append(newNewsForStorage)
        }
        
        newsStorage.set(arrayNewsForStorage, forKey: newsStorageKey)
        
    }
    
}
