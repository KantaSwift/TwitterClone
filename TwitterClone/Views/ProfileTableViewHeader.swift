//
//  ProfileHeader.swift
//  TwitterClone
//
//  Created by 上條栞汰 on 2022/10/26.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
    private enum SectionTabs: String {
        case tweets = "Tweets"
        case tweetsAndReplies = "Tweets&Replies"
        case media = "Media"
        case likes = "Likes"
        
        var index: Int {
            switch self {
            case .tweets:
                return 0
            case .tweetsAndReplies:
                return 1
            case .media:
                return 2
            case .likes:
                return 3
            }
        }
    }
    
    private var selectedTab = 0 {
        didSet {
            print(selectedTab)
        }
    }
    
    private var tabs: [UIButton] = ["Tweets", "Tweets&Replies", "Media", "Likes"].map { buttonTitles in
        let button = UIButton(type: .system)
        button.setTitle(buttonTitles, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.tintColor = .label
        return button
    }
    
    private lazy var sectionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private let followersTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Followers"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let followersCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1M"
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let followingTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Following"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let followingCountLabel: UILabel = {
        let label = UILabel()
        label.text = "314"
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let joinDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Joined May 2022"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let joinDateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "calendar", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        imageView.tintColor = .secondaryLabel
        return imageView
    }()
    
    private let userBioLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.text = "iOS Developer"
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@testUser"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "TestUser"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let profileViewHeaderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sampleImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let profileAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .systemYellow
        imageView.layer.cornerRadius = 40
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureConstraint()
        configureStackButton()
    }
    
    private func configureStackButton() {
        for (_, button) in sectionStackView.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else { return }
            button.addTarget(self, action: #selector(didTapTab(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func didTapTab(_ sender: UIButton) {
        guard let label = sender.titleLabel?.text else { return }
        switch label {
        case SectionTabs.tweets.rawValue:
            selectedTab = 0
        case SectionTabs.tweetsAndReplies.rawValue:
            selectedTab = 1
        case SectionTabs.media.rawValue:
            selectedTab = 2
        case SectionTabs.likes.rawValue:
            selectedTab = 3
        default:
            print("error")
        }
    }
    
    private func setupViews() {
        addSubview(profileViewHeaderImageView)
        addSubview(profileAvatarImageView)
        addSubview(displayNameLabel)
        addSubview(userNameLabel)
        addSubview(userBioLabel)
        addSubview(joinDateImageView)
        addSubview(joinDateLabel)
        addSubview(followingCountLabel)
        addSubview(followingTextLabel)
        addSubview(followersCountLabel)
        addSubview(followersTextLabel)
        addSubview(sectionStackView)
    }
    
    private func configureConstraint() {
        profileViewHeaderImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 180)
        profileAvatarImageView.anchor(left: leftAnchor, centerY: profileViewHeaderImageView.bottomAnchor, width: 80, height: 80, leftPadding: 20)
        displayNameLabel.anchor(top: profileAvatarImageView.bottomAnchor, left: profileAvatarImageView.leftAnchor, topPadding: 10)
        userNameLabel.anchor(top: displayNameLabel.bottomAnchor, left: displayNameLabel.leftAnchor, topPadding: 5)
        userBioLabel.anchor(top: userNameLabel.bottomAnchor, left: displayNameLabel.leftAnchor, right: rightAnchor, topPadding: 5, rightPadding: 5)
        joinDateImageView.anchor(top: userBioLabel.bottomAnchor ,left: displayNameLabel.leftAnchor, topPadding: 5)
        joinDateLabel.anchor(bottom: joinDateImageView.bottomAnchor, left: joinDateImageView.rightAnchor, leftPadding: 2)
        followingCountLabel.anchor(top: joinDateLabel.bottomAnchor, left: displayNameLabel.leftAnchor, topPadding: 5)
        followingTextLabel.anchor(bottom: followingCountLabel.bottomAnchor, left: followingCountLabel.rightAnchor, leftPadding: 4)
        followersCountLabel.anchor(bottom: followingTextLabel.bottomAnchor, left: followingTextLabel.rightAnchor, leftPadding: 8)
        followersTextLabel.anchor(bottom: followersCountLabel.bottomAnchor, left: followersCountLabel.rightAnchor, leftPadding: 4)
        sectionStackView.anchor(top: followingCountLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, topPadding: 1, leftPadding: 25, rightPadding: 25)
        sectionStackView.anchor(height: 35)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
