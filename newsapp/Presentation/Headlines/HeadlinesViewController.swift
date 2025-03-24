//
//  HeadlinesViewController.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 11/03/25.
//

import UIKit

class HeadlinesViewController: UIViewController {
    
    private let viewModel = HeadlinesViewModel()
    private var newsList = [Article]()

    let dummyArticles: [Article] = [
        Article(
            source: Source(id: "1", name: "BBC"),
            author: "John Doe",
            title: "Breaking News: Swift 6 Released!",
            description: "Swift 6 brings massive performance improvements and new features.",
            url: "https://example.com",
            urlToImage: "https://fastly.picsum.photos/id/316/200/300.jpg?hmac=sq0VBO6H0wGg9Prod7MVUUB_7B91kmD5E1X1TRSo66U",
            publishedAt: "2025-03-24T14:30:00Z",
            content: "Detailed content of the article goes here."
        ),
        Article(
            source: Source(id: "2", name: "CNN"),
            author: "Jane Smith",
            title: "iOS 19 is Here!",
            description: "Apple introduces new features with iOS 19.",
            url: "https://example.com",
            urlToImage: "https://fastly.picsum.photos/id/316/200/300.jpg?hmac=sq0VBO6H0wGg9Prod7MVUUB_7B91kmD5E1X1TRSo66U",
            publishedAt: "2025-03-24T14:30:00Z",
            content: "Detailed content of the article goes here."
        ),
        Article(
            source: Source(id: "3", name: "TechCrunch"),
            author: "Alex Johnson",
            title: "AI is Revolutionizing the Tech Industry",
            description: "Artificial Intelligence is changing how we approach technology.",
            url: "https://example.com",
            urlToImage: "https://fastly.picsum.photos/id/316/200/300.jpg?hmac=sq0VBO6H0wGg9Prod7MVUUB_7B91kmD5E1X1TRSo66U",
            publishedAt: "2025-03-24T14:30:00Z",
            content: "Detailed content of the article goes here."
        )
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchHeadlines()
        configureViewController()
        configureNewsTableView()
        

        // Do any additional setup after loading the view.
    }
    
    private let headlinesTableView = UITableView()
    
    func configureViewController() {
        self.title = "Headlines"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureNewsTableView() {
        view.addSubview(headlinesTableView)
        headlinesTableView.translatesAutoresizingMaskIntoConstraints = false
        
        headlinesTableView.delegate = self
        headlinesTableView.dataSource = self
        headlinesTableView.register(NewsCardCell.self, forCellReuseIdentifier: NewsCardCell.identifier)
        
        NSLayoutConstraint.activate([
            headlinesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headlinesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headlinesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headlinesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    



}

extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCardCell.identifier, for: indexPath) as! NewsCardCell
        let article = dummyArticles[indexPath.row]
        cell.titleLabel.text = article.title
        cell.newsDescriptionLabel.text = article.description

        cell.newsImageView.image = UIImage(named: "photo")
        return cell
    }
    
    
}
