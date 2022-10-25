//
//  Resources.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 17.10.2022.
//

import UIKit

enum Resources {
    
    enum FieldsName: String, CaseIterable {
        case firstName = "Имя"
        case secondName = "Фамилия"
        case thirdName = "Отчество"
        case birthDay = "Дата Рождения"
        case gender = "Пол"
    }
    
    enum Gender: String, CaseIterable {
        case noSpecified = "Не указано"
        case man = "Мужской"
        case woman = "Женский"
    }
    
    
    enum Fonts {
        static func avenirNextRegular(with size: CGFloat) -> UIFont? {
            UIFont(name: "Avenir Next", size: size)
        }
    }
}
