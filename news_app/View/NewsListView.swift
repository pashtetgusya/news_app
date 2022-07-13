//
//  NewsView.swift
//  news_app
//
//  Created by Pavel Yarovoi on 04.07.2022.
//

import UIKit

class NewsListView: UIView {
    
    lazy var newsTableView = UITableView()
    lazy var newsSearchBar = UISearchBar()
    lazy var newsTableRefreshControl = UIRefreshControl()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .white
        
        self.newsTableView.addSubview(newsTableRefreshControl)

        self.addSubview(newsSearchBar)
        self.addSubview(newsTableView)
        self.setupConstraints()
        self.setupSearchField()
        self.setupNewsTable()
    }
    
    private func setupConstraints() {
        newsSearchBar.translatesAutoresizingMaskIntoConstraints = false
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsSearchBar.widthAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.widthAnchor),
//            newsSearchBar.heightAnchor.constraint(equalToConstant: 80),
            newsSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            newsSearchBar.bottomAnchor.constraint(equalTo: newsTableView.topAnchor),
            
            newsTableView.widthAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.widthAnchor),
            newsTableView.heightAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.heightAnchor),
            newsTableView.topAnchor.constraint(equalTo: newsSearchBar.bottomAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupSearchField() {
        newsSearchBar.placeholder = "Поиск новостей"
    }
    
    private func setupNewsTable() {
        newsTableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: "newsTableViewCell")
    }
    
}
