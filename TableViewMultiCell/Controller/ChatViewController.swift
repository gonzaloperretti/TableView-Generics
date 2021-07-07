//
//  ViewController.swift
//  TableViewMultiCell
//
//  Created by Gonzalo Perretti on 1/7/21.
//

import UIKit

class ChatViewController: UIViewController {

    enum CellType {
        case received
        case sent
        init(userName: String) {
            self = userName == "Me" ? .received : .sent
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let model: Model  = ModelManager()
    var messages: [ChatItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.fetchInfo(type: [ChatItem].self) { [weak self] result in
            switch result {
            case .success(let items):
                self?.messages = items
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < messages.count else {
            print("IndexPath error: \(indexPath)")
            return UITableViewCell()
        }
        let message = messages[indexPath.row]
        
        var cellIdentifier: String
        var viewModel: ViewModel
        let cellType = CellType.init(userName: message.user)
        
        switch cellType {
        case .received:
            cellIdentifier = SenderCell.reusableIdentifier
            viewModel = SentMessageViewModel(item: message)
        default:
            cellIdentifier = ReceiverCell.reusableIdentifier
            viewModel = ReceivedMessageViewModel(item: message)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.configure(viewModel: viewModel)
        return cell
    }
}
