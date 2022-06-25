//
//  NewsViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

class NewsViewController: UIViewController, Storyboarded {
    
    @IBOutlet var tableView: UITableView!
    
    var coordinator: NewsCoordinator?
    var didSendEventClosure: ((NewsViewController.Event) -> Void)?
    var mockData = NewsMockData.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        title = "Новости"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        mockData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockData[section].newsItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId,
                                                           for: indexPath) as? NewsCell else {
            fatalError("Not found \(NewsCell.reuseId)")
        }
        let date = mockData[indexPath.section].date
        let newsItem = mockData[indexPath.section].newsItem[indexPath.row]
        cell.set(
            model: NewsViewModel(date: date,
                                 newsItem: NewsItem(
                                    title: newsItem.title,
                                    description: newsItem.description,
                                    imageURL: newsItem.imageURL)
                                )
        )
        return cell
    }
}

extension NewsViewController {
    enum Event {
        case news
    }
}
