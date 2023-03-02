//
//  NotificationTableController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit

final class NotificationController: UIViewController, CustomSplitViewDelegate {
    let cellId = "cell"
    let cell2 = "cell2"
    var dataSource: [Any] = MockNotifications.notifications
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(NotificationCell.self, forCellReuseIdentifier: cellId)
        table.register(PostCell.self, forCellReuseIdentifier: cell2)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (navigationController! as! NotificationNavigationController).customDelegate = self
        view.backgroundColor = .white
        tableView.dataSource = self
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(93)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func didSelectMentions() {
        dataSource = MockPosts.posts
        tableView.reloadData()
    }
    
    func didSelectAll() {
        dataSource = MockNotifications.notifications
        tableView.reloadData()
    }
}

extension NotificationController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if dataSource is [Notification] {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NotificationCell
            cell.configure(with: dataSource[indexPath.row] as! Notification)
            return cell
        } else if dataSource is [Post] {
            let cell = tableView.dequeueReusableCell(withIdentifier: cell2, for: indexPath) as! PostCell
            cell.configure(with: dataSource[indexPath.row] as! Post)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NotificationCell
        cell.configure(with: MockNotifications.notifications[indexPath.row])
        return cell
    }
}
