//
//  BirthdayTableViewCell.swift
//  BirthdayTracker
//
//  Created by Yushkevich Ilya on 8.03.22.
//

import UIKit
import SnapKit

class BirthdayTableViewCell: UITableViewCell {

    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let birthdayStackView: UIStackView
    private let profileImageView: UIImageView
    private let nameStackView: UIStackView
    private let nameLabel: UILabel
    private let surnameLabel: UILabel
    private let birthdayLabel: UILabel
    private let ageLabel: UILabel

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        birthdayStackView = UIStackView()
        profileImageView = UIImageView()
        nameStackView = UIStackView()
        nameLabel = UILabel()
        surnameLabel = UILabel()
        birthdayLabel = UILabel()
        ageLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
        addSubviews()
        addConstraints()
        layerConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API
    func setProps() {
        nameLabel.text = "qwe"
        surnameLabel.text = "qwe"
        ageLabel.text = "Age - \(20)"
        birthdayLabel.text = "24.04.2001"
    }
    // MARK: - Setups
    private func setupUI() {
        //nameLabel
        nameLabel.textAlignment = .center
        
        //surnameLabel
        surnameLabel.textAlignment = .center
        
        //birthdayLabel
        birthdayLabel.textAlignment = .center
        
        //ageLabel
        ageLabel.font = .boldSystemFont(ofSize: 16)
        ageLabel.textColor = .lightGray
        ageLabel.textAlignment = .center
        
        //birthdayStackView
        birthdayStackView.backgroundColor = .white
        birthdayStackView.axis = .horizontal
        birthdayStackView.alignment = .fill
        birthdayStackView.distribution = .fillEqually
        birthdayStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        //nameStackView
        nameStackView.axis = .vertical
        nameStackView.distribution = .fillEqually
        nameStackView.spacing = UIStackView.spacingUseSystem
        nameStackView.isLayoutMarginsRelativeArrangement = true
        nameStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    }

    private func addSubviews() {
        contentView.addSubview(birthdayStackView)
        birthdayStackView.addArrangedSubview(profileImageView)
        birthdayStackView.addArrangedSubview(nameStackView)
        birthdayStackView.addArrangedSubview(birthdayLabel)
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(surnameLabel)
        nameStackView.addArrangedSubview(ageLabel)

    }

    private func addConstraints() {
        birthdayStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
    private func layerConfiguration() {
        //birthdayStackView
        birthdayStackView.layer.cornerRadius = 10
        birthdayStackView.layer.shadowOffset = CGSize(width: 2, height: 2)
        birthdayStackView.layer.shadowRadius = birthdayStackView.layer.cornerRadius
        birthdayStackView.layer.shadowOpacity = 0.3
        
        //profileImageView
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        
    }
    // MARK: - Helpers
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
}
