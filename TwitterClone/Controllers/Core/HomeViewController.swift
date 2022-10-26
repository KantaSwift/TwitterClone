//
//  HomeViewController.swift
//  TwitterClone
//
//  Created by 上條栞汰 on 2022/10/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let timeLineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        timeLineTableView.delegate = self
        timeLineTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        timeLineTableView.frame = view.frame
    }
    
    private func setupViews() {
        view.addSubview(timeLineTableView)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TweetTableViewCell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension HomeViewController: TweetTableViewCellDelegate {
    func replyButtonDidTap() {
        print("reply")
    }
    
    func reTweetButtonDidTap() {
        print("reTweet")
    }
    
    func likeButtonDidTap() {
        print("like")
    }
    
    func shareButtonDidTap() {
        print("share")
    }
}
