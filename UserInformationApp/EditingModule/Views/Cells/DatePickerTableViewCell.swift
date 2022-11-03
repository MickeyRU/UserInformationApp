//
//  DatePickerTableViewCell.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 24.10.2022.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {
    
    static let idDatePickerTableViewCell = "idDatePickerTableViewCell"
    
    private let nameLabel = UILabel()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        //Ограничиваем максимальную дату - текущей
        datePicker.maximumDate = Date()
        //Убираем рамку у дейтпикера - делаем ее прозрачной - для этого необходимо добраться до 3 вью
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0
        return datePicker
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
        contentView.addViews(datePicker)
    }
    
    
    func configure(_ name: String, date: Date) {
        nameLabel.text = name
        datePicker.date = date
    }
    
    public func getCellValue() -> String {
        datePicker.date.getStringFromDate()
    }
}

//MARK: - Set Constraints

extension DatePickerTableViewCell {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            datePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}

