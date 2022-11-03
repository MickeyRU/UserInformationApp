//
//  UITableView + Extension.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 02.11.2022.
//

import UIKit

extension UITableView {
    
    // Упрощаем процедуру регистрации ячейки - ReuseIdentifier будет именем класса
    func register(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(type, forCellReuseIdentifier: className)
    }
    
    // Дженерик для создания переиспользуемой ячейки
    func dequeuReusableCell<T>(_ type: T.Type) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
}
