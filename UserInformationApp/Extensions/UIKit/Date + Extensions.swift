//
//  Date + Extensions.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 03.11.2022.
//

import UIKit

extension Date {
    //Получаем из даты строчку
    func getStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
