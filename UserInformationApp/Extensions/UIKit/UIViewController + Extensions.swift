//
//  UIViewController + Extensions.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 31.10.2022.
//

import UIKit

extension UIViewController {
    
    func presentSimpleAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func presentSaveAlert(complitionHandler: @escaping (Bool) -> Void) {
        
        let alertController = UIAlertController(title: "Данные были изменены", message: "Вы желаете сохранить изменения, в противном случае внесенные правки будут отменены", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Cохранить", style: .default) { _ in
            complitionHandler(true)
        }
        let skipAction = UIAlertAction(title: "Пропустить", style: .default) { _ in
            complitionHandler(false)
        }
        alertController.addAction(saveAction)
        alertController.addAction(skipAction)
        present(alertController, animated: true)
    }
}
