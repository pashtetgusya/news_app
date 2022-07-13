//
//  NewsController.swift
//  news_app
//
//  Created by Pavel Yarovoi on 04.07.2022.
//

import UIKit

class NewsListController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    lazy var newsListView = NewsListView()
    
    private let networkManager = NetworkManager()
    private let newsStorage = NewsStorage()
    
    private var newsFromStorage: [NewsInfo] = []
        
    override func loadView() {
        self.view = newsListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.newsListView.newsTableRefreshControl.addTarget(self, action: #selector(callPullToRefresh), for: .valueChanged)
        self.newsListView.newsTableView.keyboardDismissMode = .onDrag
        
        self.newsListView.newsTableView.dataSource = self
        self.newsListView.newsTableView.delegate = self
        self.newsListView.newsSearchBar.delegate = self
        
        self.newsFromStorage = newsStorage.loadNewsWithStorage()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFromStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsTableViewCell", for: indexPath) as! NewsListTableViewCell
            
        guard let newsAuthor = newsFromStorage[indexPath.row].author,
              let newsTitle = newsFromStorage[indexPath.row].title,
              let newsDescription = newsFromStorage[indexPath.row].articleDescription,
              let newsUrlToImage = newsFromStorage[indexPath.row].urlToImage,
              let newsCountView = newsFromStorage[indexPath.row].countView,
              let newsPublishedAt = newsFromStorage[indexPath.row].publishedAt else {
            return cell
        }

        cell.newsAuthorLabel.text = newsAuthor
        cell.newsTitleLabel.text = newsTitle
        cell.newsDescriptionLabel.text = newsDescription
        cell.newsCountViewsLabel.text = newsCountView.description
        cell.newsPublishedAtLabel.text = newsPublishedAt
        
        self.networkManager.getNewsImage(urlString: newsUrlToImage) { newsImage in
            DispatchQueue.main.async {
                cell.newsImageView.image = newsImage
            }
            
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsUrlString = newsFromStorage[indexPath.row].url else {
            return
        }
        guard let newsUrl = URL(string: newsUrlString) else {
            return
        }
        
        UIApplication.shared.open(newsUrl)
        newsFromStorage[indexPath.row].countView! += 1
        self.newsStorage.updateNewsInStorage(news: newsFromStorage)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.getNews()
    }
    
    @objc func callPullToRefresh() {
        self.getNews()
        self.newsListView.newsTableRefreshControl.endRefreshing()
    }
    
    private func getNews() {
        guard let keywords = self.newsListView.newsSearchBar.text else {
            return
        }
        
        self.networkManager.getNews(pageSize: 20, language: "ru", sortBy: "publishedAt", keywords: keywords) {newsListInfo in
            guard let newsArticles = newsListInfo.articles else {
                return
            }
            self.newsStorage.saveNewsInStorage(news: newsArticles)
        }
        
        self.newsFromStorage = self.newsStorage.loadNewsWithStorage()
        self.newsListView.newsTableView.reloadData()
    }
    
}
