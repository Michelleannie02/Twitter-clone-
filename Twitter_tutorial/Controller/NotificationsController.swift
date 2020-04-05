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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = .default
    }
    
    // MARK: - Selectors
    
    @objc func handleRefresh(){
        fetchNotifications()
    }
    
    
    // MARK: - API
    func fetchNotifications(){
        refreshControl?.beginRefreshing()
        
        NotificationService.shared.fetchNotification { notifications in
            self.refreshControl?.endRefreshing()
            self.notifications = notifications
            self.checkIfUserIsFollowed(notifications: notifications)
        }
    }
    func checkIfUserIsFollowed(notifications:[Notification]) {
        for (index, notification) in notifications.enumerated() {
            if case .follow = notification.type {
                let user = notification.user
                
                UserService.shared.checkIfUserIsFollowed(uid: user.uid) { isFollowed in
                    self.notifications[index].user.isFollowed = isFollowed
                }
            }
        }
    }
    // MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Notification"
        
        tableView.register(NotificationCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
}
// MARK: - UITableViewDataSouce
extension NotificationsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NotificationCell
        cell.notification = notifications[indexPath.row]
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate
extension NotificationsController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notigfication = notifications[indexPath.row]
        guard let tweetID = notigfication.tweetID else { return }
        TweetService.shared.fetchTweet(withTweetID: tweetID) { tweet in
            let controller = TweetController(tweet: tweet)
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
}
// MARK: - NotificationCellDelegate

extension NotificationsController:NotificationCellDelegate {
    func didTapFollow(_ cell: NotificationCell) {
        guard let user = cell.notification?.user else { return }
        
        if user.isFollowed {
            UserService.shared.unfollowuUser(uid: user.uid) { (err, ref) in
                cell.notification?.user.isFollowed = false
            }
        } else {
            UserService.shared.followUser(uid: user.uid) { (err, ref) in
                cell.notification?.user.isFollowed = true
            }
        }
    }
    
    func didTapProfileImage(_ cell: NotificationCell) {
        guard let user = cell.notification?.user else { return }
        let controller = ProfileController(user: user)
        navigationController?.pushViewController(controller, animated: true)
    }
}
