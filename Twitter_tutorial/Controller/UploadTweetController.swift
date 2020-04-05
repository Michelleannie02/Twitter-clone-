//
//  UploadTweetController.swift
//  Twitter_tutorial
//
//  Created by 梶村律太 on 2020/03/29.
//  Copyright © 2020 梶村律太. All rights reserved.
//

import UIKit



class UploadTweetController: UIViewController {
    
    // MARK: - Properties
    
    private let user:User
    
    private let config: UploadTweetConfiguration
    
    private lazy var viewModel = UploadTweetViewModel(config: config)
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .twitterBlue
        button.setTitle("Tweet", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        
        button.addTarget(self, action: #selector(handleUploadTweet), for: .touchUpInside)
    
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .twitterBlue
        return iv
    }()
    
    private lazy var replyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "replying to @venom"
        label.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        return label
    }()
    
    private let captionTextView = CaptionTextView()
    
    
    // MARK: - Lifecycle
    init(user:User,config: UploadTweetConfiguration){
        self.user = user
        self.config = config
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        switch config{
        case .tweet:
            print("DeBUG Configure is tweet")
        case .reply(let tweet):
            print("DEBUG to \(tweet.caption)")
            
        }
    }
    
    // MARK: - Selecters
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    @objc func handleUploadTweet(){
        guard let caption = captionTextView.text else { return }
        TweetService.shared.uploadTweet(caption: caption,type: config) { (error, ref) in
            if let error = error{
                print("DEBUG: Failed to Tweet with\(error)")
                return
            }
            if case .reply(let tweet) = self.config{
                NotificationService.shared.uploadNotifications(type: .reply, tweet: tweet)
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - API
    
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        configureNavigationBar()
        
        
        let ImageCaptionstack = UIStackView(arrangedSubviews: [profileImageView,captionTextView])
        ImageCaptionstack.axis = .horizontal
        ImageCaptionstack.spacing = 12
        ImageCaptionstack.alignment = .leading
        
        let stack = UIStackView(arrangedSubviews: [replyLabel,ImageCaptionstack])
        stack.axis = .vertical
//        stack.alignment = .leading
        stack.spacing = 12
        
        view.addSubview(stack)
        stack.anchor(top:view.safeAreaLayoutGuide.topAnchor,left:view.leftAnchor,
                     right:view.rightAnchor, paddingTop: 16,paddingLeft: 16,
                     paddingRight: 16)
        
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
        
        actionButton.setTitle(viewModel.actionButtonTitle, for: .normal)
        captionTextView.placeholderLabel.text = viewModel.placeholderText
        
        replyLabel.isHidden = !viewModel.shouldShowReplyLabel
        guard let replyText = viewModel.replyText else { return }
        replyLabel.text = replyText
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = .twitterBlue
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
    }
}
