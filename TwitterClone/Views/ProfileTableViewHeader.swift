//
//  ProfileHeader.swift
//  TwitterClone
//
//  Created by 上條栞汰 on 2022/10/26.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
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
    }
    
    private func setupViews() {
        addSubview(profileViewHeaderImageView)
        addSubview(profileAvatarImageView)
        addSubview(displayNameLabel)
        addSubview(userNameLabel)
        addSubview(userBioLabel)
        addSubview(joinDateImageView)
        addSubview(joinDateLabel)
    }
    
    private func configureConstraint() {
        profileViewHeaderImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 180)
        profileAvatarImageView.anchor(left: leftAnchor, centerY: profileViewHeaderImageView.bottomAnchor, width: 80, height: 80, leftPadding: 20)
        displayNameLabel.anchor(top: profileAvatarImageView.bottomAnchor, left: profileAvatarImageView.leftAnchor, topPadding: 10)
        userNameLabel.anchor(top: displayNameLabel.bottomAnchor, left: displayNameLabel.leftAnchor, topPadding: 10)
        userBioLabel.anchor(top: userNameLabel.bottomAnchor, left: displayNameLabel.leftAnchor, right: rightAnchor, topPadding: 5, rightPadding: 5)
        joinDateImageView.anchor(top: userBioLabel.bottomAnchor ,left: displayNameLabel.leftAnchor, topPadding: 5)
        joinDateLabel.anchor(bottom: joinDateImageView.bottomAnchor, left: joinDateImageView.rightAnchor, leftPadding: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
