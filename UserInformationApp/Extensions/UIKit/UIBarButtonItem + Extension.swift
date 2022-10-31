//
//  UIBarButtonItem + Extension.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 31.10.2022.
//

import UIKit

extension UIBarButtonItem {
    
    static func createCustomButton(vc: UIViewController, selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.setTitle("Назад", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.addTarget(vc, action: selector, for: .touchUpInside)
        
        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
}
