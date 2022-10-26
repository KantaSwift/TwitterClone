//
//  TweetTableViewCell.swift
//  TwitterClone
//
//  Created by 上條栞汰 on 2022/10/26.
//

import UIKit

protocol TweetTableViewCellDelegate: AnyObject {
    func replyButtonDidTap()
    func reTweetButtonDidTap()
    func likeButtonDidTap()
    func shareButtonDidTap()
}

final class TweetTableViewCell: UITableViewCell {
    
    weak var delegate: TweetTableViewCellDelegate?
    
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
    
    private lazy var replyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private lazy var reTweetButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [replyButton, reTweetButton, likeButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        configureConstraint()
        configureButtons()
    }
    
    private func setupViews() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayName)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(tweetContentLabel)
        contentView.addSubview(buttonStackView)
    }
    
    private func configureButtons() {
        replyButton.addTarget(self, action: #selector(replyButtonDidTap), for: .touchUpInside)
        reTweetButton.addTarget(self, action: #selector(reTweetButtonDidTap), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(likeButtonDidTap), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func replyButtonDidTap() {
        delegate?.replyButtonDidTap()
    }
    
    @objc private func reTweetButtonDidTap() {
        delegate?.reTweetButtonDidTap()
    }
    
    @objc private func likeButtonDidTap() {
        delegate?.likeButtonDidTap()
    }
    
    @objc private func shareButtonDidTap() {
        delegate?.shareButtonDidTap()
    }
    
    private func configureConstraint() {
        avatarImageView.anchor(top: topAnchor, left: leftAnchor, width: 50, height: 50, topPadding: 20, leftPadding: 14)
        displayName.anchor(top: topAnchor, left: avatarImageView.rightAnchor, topPadding: 20, leftPadding: 20)
        userNameLabel.anchor(left: displayName.rightAnchor, centerY: displayName.centerYAnchor, leftPadding: 10)
        tweetContentLabel.anchor(top: displayName.bottomAnchor, left: displayName.leftAnchor, right: rightAnchor, topPadding: 5, bottomPadding: 15, rightPadding: 15)
        buttonStackView.anchor(top: tweetContentLabel.bottomAnchor, left: tweetContentLabel.leftAnchor, right: rightAnchor, topPadding: 5, rightPadding: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

