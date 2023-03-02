//
//  MessageTableController.swift
//  Twitter-Clone
//
//  Created by Emir Alkal on 1.03.2023.
//

import UIKit

final class MessageController: UIViewController {
    let cellId = "cell"
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(MessagePreviewCell.self, forCellReuseIdentifier: cellId)
        table.rowHeight = 55 + 24
        table.allowsSelection = false
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setupTable()
        view.backgroundColor = .white
    }
    
    private func setupTable() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(93)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension MessageController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MockMessagePreviews.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessagePreviewCell
        cell.configure(with: MockMessagePreviews.messages[indexPath.row])
        return cell
    }
}
