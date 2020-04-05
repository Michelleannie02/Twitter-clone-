//
//  NotificationController.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/26.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit

private let reuseIdentifier = "NotificationCell"

class NotificationsController: UITableViewController {
       
    // MARK: - Properties
    private var notifications = [Notification]() {
        didSet{ tableView.reloadData() }
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchNotifications()
    }
    // MARK: - API
    func fetchNotifications(){
        NotificationService.shared.fetchNotification { notifications in
            self.notifications = notifications
        }
    }
    // MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Notification"
        
        tableView.register(NotificationCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        
    }
}
extension NotificationsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NotificationCell
        cell.notification = notifications[indexPath.row]
        return cell
    }
}
