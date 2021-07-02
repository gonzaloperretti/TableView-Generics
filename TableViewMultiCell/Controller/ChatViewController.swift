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
            self = userName == "Me" ? .sent : .received
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
        // Do any additional setup after loading the view.
        
        model.fetchInfo() { [weak self] messages in
            self?.messages = messages
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
        
        let cellType = CellType.init(userName: message.user)
        let cell: UITableViewCell?
        
        switch cellType {
        case .received:
            let receiverCell: ReceiverCell? = tableView.dequeueCell(for: indexPath)
            let viewModel = ReceivedMessageViewModel(item: message)
            receiverCell?.configure(using: viewModel)
            cell = receiverCell
        default:
            let senderCell: SenderCell? = tableView.dequeueCell(for: indexPath)
            let viewModel = SentMessageViewModel(item: message)
            senderCell?.configure(using: viewModel)
            cell = senderCell
        }
        
        return cell ?? UITableViewCell()
    }
}
