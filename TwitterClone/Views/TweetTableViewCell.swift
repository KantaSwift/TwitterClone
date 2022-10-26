//
//  TweetTableViewCell.swift
//  TwitterClone
//
//  Created by 上條栞汰 on 2022/10/26.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .systemPink
        return imageView
    }()
    
    private let displayName: UILabel = {
        let label = UILabel()
        label.text = "testUser"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@testUser"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let tweetContentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "This is mockup tweet. It is going to take multiple line. I believe some more text is enough but lets add some more any..."
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        configureConstraint()
    }
    
    private func setupViews() {
        addSubview(avatarImageView)
        addSubview(displayName)
        addSubview(userNameLabel)
        addSubview(tweetContentLabel)
    }
    
    private func configureConstraint() {
        avatarImageView.anchor(top: topAnchor, left: leftAnchor, width: 50, height: 50, topPadding: 20, leftPadding: 14)
        displayName.anchor(top: topAnchor, left: avatarImageView.rightAnchor, topPadding: 20, leftPadding: 20)
        userNameLabel.anchor(left: displayName.rightAnchor, centerY: displayName.centerYAnchor, leftPadding: 10)
        tweetContentLabel.anchor(top: displayName.bottomAnchor, left: displayName.leftAnchor, right: rightAnchor, topPadding: 5, bottomPadding: 15, rightPadding: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
