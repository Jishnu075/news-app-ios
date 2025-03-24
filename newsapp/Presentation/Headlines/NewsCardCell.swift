//
//  NewsCardCell.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 24/03/25.
//

import UIKit

class NewsCardCell: UITableViewCell {
    static let identifier = "NewsCardCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTitleLabel()
        configureNewsDescriptionLabel()
        configureNewsImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func configureTitleLabel () {
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant : -10)
        ])
    }
    
    func configureNewsDescriptionLabel () {
        contentView.addSubview(newsDescriptionLabel)
        
        NSLayoutConstraint.activate([
            newsDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            newsDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant : -5),
            newsDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
    
    func configureNewsImageView () {
        contentView.addSubview(newsImageView)
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            newsImageView.heightAnchor.constraint(equalToConstant: 50),
            newsImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    

}
