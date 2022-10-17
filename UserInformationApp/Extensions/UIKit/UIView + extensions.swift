//
//  UIKit + extensions.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 17.10.2022.
//

import UIKit

extension UIView {
    
    func addViews(_ view: UIView){
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
