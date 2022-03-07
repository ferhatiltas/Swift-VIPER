//
//  View.swift
//  SwiftVIPER
//
//  Created by ferhatiltas on 7.03.2022.
//

import Foundation
import UIKit

// to talks -> presenter
// class, protocol
// ViewController

class UserViewController : UIViewController,AnyView,UITableViewDelegate,UITableViewDataSource{
    var presenter: AnyPresenter?
    var users : [UserModel] = []
    private let messageLabel : UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Loading..."
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let tableView : UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds // ekranin tamamini kaplasin
        messageLabel.frame = CGRect(x: view.frame.width/2 - 200/2, y: view.frame.height/2 - 60/2, width: 200, height: 60) // yeri belirle -- 200/2
    }
    
    func notify(with users: [UserModel]) {
        DispatchQueue.main.async {
            self.users = users
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func notify(with error: String) {
        DispatchQueue.main.async {
            self.users = []
            self.tableView.isHidden = true
            self.messageLabel.text = error
            self.messageLabel.isHidden = false
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = users[indexPath.row].name
        content.secondaryText = users[indexPath.row].username
        cell.contentConfiguration = content
//        cell.backgroundColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailsViewController()
        detailsViewController.name = users[indexPath.row].name ?? "ERR"
        detailsViewController.username = users[indexPath.row].username  ?? "ERR"
        detailsViewController.email = users[indexPath.row].email  ?? "ERR"
        detailsViewController.website = users[indexPath.row].website  ?? "ERR"
        detailsViewController.phone = users[indexPath.row].phone  ?? "ERR"
        detailsViewController.adress = users[indexPath.row].address?.city  ?? "ERR"
        
        self.present(detailsViewController, animated: true, completion: nil)
    }
}
