//
//  MainTableViewCell.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 17.10.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let idMainTableViewCell = "idMainTableViewCell"
    
    private let nameLabel = UILabel()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        nameLabel.font = Resources.Fonts.avenirNextRegular(with: 18)
        addViews(nameLabel)
        addViews(valueLabel)
    }
    
    
    func configure(name: String, value: String) {
        nameLabel.text = name
        valueLabel.text = value == "" ? "Нет данных" : value
    }
}

extension MainTableViewCell {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Устанавливает минимально значение размера ячейки
            heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -10)
        ])
    }
}
