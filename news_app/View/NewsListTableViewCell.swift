//
//  NewsTableViewCell.swift
//  news_app
//
//  Created by Pavel Yarovoi on 04.07.2022.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    let newsInfoView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    let newsInfoStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    let newsDataStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        
        return stackView
    }()

    
    let newsImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        
        return img
    }()
    
    let newsTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        
        return label
    }()
    
    let newsAuthorLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.textColor = .black
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let newsDescriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let newsViewsAndDateStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .horizontal
        
        return stackView
    }()

    let newsViewsIcon:UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "eye"))
        image.tintColor = .black
        
        return image
    }()
    
    let newsCountViewsLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let newsPublishedAtLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.newsInfoView.addSubview(newsTitleLabel)
        self.newsInfoView.addSubview(newsAuthorLabel)
        
        self.newsInfoStackView.addSubview(newsImageView)
        self.newsInfoStackView.addSubview(newsInfoView)
        
        self.newsViewsAndDateStackView.addSubview(newsViewsIcon)
        self.newsViewsAndDateStackView.addSubview(newsCountViewsLabel)
        self.newsViewsAndDateStackView.addSubview(newsPublishedAtLabel)
//
        self.newsDataStackView.addSubview(newsInfoStackView)
        self.newsDataStackView.addSubview(newsDescriptionLabel)
        self.newsDataStackView.addSubview(newsViewsAndDateStackView)
        
        self.contentView.addSubview(newsDataStackView)
        
//        self.contentView.backgroundColor = .white

        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            newsTitleLabel.widthAnchor.constraint(equalTo: newsInfoView.widthAnchor),
//            newsTitleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 70),
            newsTitleLabel.topAnchor.constraint(equalTo: newsInfoView.topAnchor),
            newsTitleLabel.bottomAnchor.constraint(equalTo: newsAuthorLabel.topAnchor),
            
            newsAuthorLabel.widthAnchor.constraint(equalTo: newsInfoView.widthAnchor),
//            newsAuthorLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30),
            newsAuthorLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor),
            newsAuthorLabel.bottomAnchor.constraint(equalTo: newsInfoView.bottomAnchor),
            
            newsImageView.widthAnchor.constraint(equalToConstant: 120),
            newsImageView.heightAnchor.constraint(equalToConstant: 120),
            newsImageView.topAnchor.constraint(equalTo: newsInfoStackView.topAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: newsInfoStackView.bottomAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: newsInfoStackView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: newsInfoView.leadingAnchor, constant: -5),
            
//            newsInfoView.heightAnchor.constraint(equalToConstant: 100),
            newsInfoView.topAnchor.constraint(equalTo: newsInfoStackView.topAnchor),
//            newsInfoView.bottomAnchor.constraint(equalTo: newsInfoStackView.bottomAnchor),
            newsInfoView.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 5),
            newsInfoView.trailingAnchor.constraint(equalTo: newsInfoStackView.trailingAnchor),

            newsInfoStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            newsInfoStackView.bottomAnchor.constraint(equalTo: newsDescriptionLabel.topAnchor),
            newsInfoStackView.leadingAnchor.constraint(equalTo: newsDataStackView.leadingAnchor),
            newsInfoStackView.trailingAnchor.constraint(equalTo: newsDataStackView.trailingAnchor),

            newsDescriptionLabel.topAnchor.constraint(equalTo: newsInfoStackView.bottomAnchor),
            newsDescriptionLabel.bottomAnchor.constraint(equalTo: newsViewsAndDateStackView.topAnchor),
            newsDescriptionLabel.leadingAnchor.constraint(equalTo: newsDataStackView.leadingAnchor),
            newsDescriptionLabel.trailingAnchor.constraint(equalTo: newsDataStackView.trailingAnchor),
            
//            newsViewsIcon.topAnchor.constraint(equalTo: newsViewsAndDateStackView.topAnchor),
            newsViewsIcon.bottomAnchor.constraint(equalTo: newsViewsAndDateStackView.bottomAnchor),
            newsViewsIcon.leadingAnchor.constraint(equalTo: newsViewsAndDateStackView.leadingAnchor),
            newsViewsIcon.trailingAnchor.constraint(equalTo: newsCountViewsLabel.leadingAnchor),

            newsCountViewsLabel.topAnchor.constraint(equalTo: newsViewsAndDateStackView.topAnchor),
            newsCountViewsLabel.bottomAnchor.constraint(equalTo: newsViewsAndDateStackView.bottomAnchor),
            newsCountViewsLabel.leadingAnchor.constraint(equalTo: newsViewsIcon.trailingAnchor),
            newsCountViewsLabel.trailingAnchor.constraint(equalTo: newsPublishedAtLabel.leadingAnchor),

            newsPublishedAtLabel.topAnchor.constraint(equalTo: newsViewsAndDateStackView.topAnchor),
            newsPublishedAtLabel.bottomAnchor.constraint(equalTo: newsViewsAndDateStackView.bottomAnchor),
//            newsPublishedAtLabel.leadingAnchor.constraint(equalTo: newsCountViewsLabel.trailingAnchor),
            newsPublishedAtLabel.trailingAnchor.constraint(equalTo: newsViewsAndDateStackView.trailingAnchor),

            newsViewsAndDateStackView.topAnchor.constraint(equalTo: newsDescriptionLabel.bottomAnchor),
            newsViewsAndDateStackView.bottomAnchor.constraint(equalTo: newsDataStackView.bottomAnchor),
            newsViewsAndDateStackView.leadingAnchor.constraint(equalTo: newsDataStackView.leadingAnchor),
            newsViewsAndDateStackView.trailingAnchor.constraint(equalTo: newsDataStackView.trailingAnchor),
            
            newsDataStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: -5),
            newsDataStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            newsDataStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            newsDataStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
