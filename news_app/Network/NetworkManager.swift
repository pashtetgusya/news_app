//
//  NetworkManager.swift
//  news_app
//
//  Created by Pavel Yarovoi on 07.07.2022.
//

import Foundation
import UIKit


class NetworkManager {
    
    private let baseUrl = "https://newsapi.org/v2/everything"
    private let apiKey = "b3f873549e9544f499b2f93e4892c616"
    
    private var imageCache = NSCache<NSString, UIImage>()
    
    func getNews(pageSize: Int, language: String, sortBy: String, keywords: String, completion: @escaping (NewsResponse) -> Void) {
        let url = URL(string: baseUrl)!
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "pageSize", value: pageSize.description),
            URLQueryItem(name: "language", value: language),
            URLQueryItem(name: "sortBy", value: sortBy),
            URLQueryItem(name: "q", value: keywords)
        ]
        
        var request = URLRequest(url: (urlComponents?.url)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let newsListData = try? JSONDecoder().decode(NewsResponse.self, from: data) {

                completion(newsListData)
            }
        }.resume()
    }
    
    func getNewsImage(urlString: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        if let cacheImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cacheImage)
        } else {
            let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
            URLSession.shared.dataTask(with: request) { data, _, error in
                let image = UIImage(data: data ?? Data()) ?? UIImage()
                
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                
                completion(image)
            }.resume()

        }
    }
    
}
