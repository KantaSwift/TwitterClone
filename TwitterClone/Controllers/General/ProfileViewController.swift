//
//  ProfileViewController.swift
//  TwitterClone
//
//  Created by 上條栞汰 on 2022/10/26.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var statusBarIsHidden = true
    
    private let profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let statusBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.layer.opacity = 0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        let headerView = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: profileTableView.frame.width, height: 380))
        
        profileTableView.tableHeaderView = headerView
        profileTableView.contentInsetAdjustmentBehavior = .never
        configureNavigationBar()
        setupViews()
        setupConstraint()
    }
    
    override func viewWillLayoutSubviews() {
        profileTableView.frame = view.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupViews() {
        view.addSubview(profileTableView)
        view.addSubview(statusBar)
    }
    
    private func setupConstraint() {
        statusBar.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        statusBar.anchor(height: view.bounds.height > 800 ? 40 : 20)
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
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        
        if yPosition > 150 && statusBarIsHidden {
            statusBarIsHidden = false
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) { [weak self] in
                self?.statusBar.layer.opacity = 1
            }
        }
        else if yPosition < 0 && !statusBarIsHidden {
            statusBarIsHidden = true
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) { [weak self] in
                self?.statusBar.layer.opacity = 0
            }
        }
    }
}
