//
//  Strings + Extensions.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 03.11.2022.
//

import UIKit

extension String {
    
    //Получаем дату из строки
    func getDateFromString() -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        let date = dateFormater.date(from: self) ?? Date()
        return date
    }
}
