//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by Yushkevich Ilya on 8.03.22.
//

import UIKit
import SnapKit

class BirthdaysListViewController: UIViewController {

    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private var birthdays: [Int]
    private let birthdaysTableView: UITableView
    // MARK: - Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        birthdaysTableView = UITableView()
        birthdays = [1, 2, 3, 4, 5, 6]
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        birthdaysTableView.register(BirthdayTableViewCell.self, forCellReuseIdentifier: "BirthdayTableViewCell")
        birthdaysTableView.delegate = self
        birthdaysTableView.dataSource = self
        birthdaysTableView.separatorStyle = .none
        
        setupUI()
        addSubviews()
        addConstraints()
    }
    
    // MARK: - API
    // MARK: - Setups
    private func setupUI() {
        //navigation
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Birthday Tracker"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeAllItems))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBirthday))
    }
    
    private func addSubviews() {
        view.addSubview(birthdaysTableView)
    }
    
    private func addConstraints() {
        birthdaysTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Helpers
    @objc private func removeAllItems() {
        
    }
    
    @objc private func addBirthday() {
        
    }
    
}

extension BirthdaysListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        birthdays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = birthdaysTableView.dequeueReusableCell(withIdentifier: "BirthdayTableViewCell") as? BirthdayTableViewCell {
            cell.selectionStyle = .none
            cell.setProps()
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            birthdays.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
