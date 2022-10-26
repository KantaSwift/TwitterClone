//
//  ProfileViewController.swift
//  TwitterClone
//
//  Created by 上條栞汰 on 2022/10/26.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        let headerView = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: profileTableView.frame.width, height: 360))
        
        profileTableView.tableHeaderView = headerView
        configureNavigationBar()
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        profileTableView.frame = view.frame
    }
    
    private func setupViews() {
        view.addSubview(profileTableView)
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "profile"
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TweetTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
