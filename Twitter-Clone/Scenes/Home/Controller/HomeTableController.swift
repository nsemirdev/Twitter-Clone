//
//  HomeTableController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit

final class HomeTableController: UIViewController {
    let id = "cellid"
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(PostCell.self, forCellReuseIdentifier: id)
        table.rowHeight = 100
        table.separatorStyle = .none
        table.allowsSelection = false
        table.estimatedRowHeight = 55 + 29 + 29
//        table.rowHeight = 120
        table.rowHeight = UITableView.automaticDimension
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(21)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension HomeTableController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MockPosts.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! PostCell
        cell.configure(with: MockPosts.posts[indexPath.row])
        return cell
    }
}
