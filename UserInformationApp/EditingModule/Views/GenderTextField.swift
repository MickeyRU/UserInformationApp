//
//  GenderTextField.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 25.10.2022.
//

import UIKit
 
class GenderTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textAlignment = .right
        font = Resources.Fonts.avenirNextRegular(with: 18)
        tintColor = .clear
        //Причесываем тексхолдер к общему формату текста остальных строк
        let font = Resources.Fonts.avenirNextRegular(with: 18)
        attributedPlaceholder = NSAttributedString(string: "Введите данные", attributes: [.foregroundColor : UIColor.lightGray, .font : font as Any])
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        //Отключаем возможность вставлять или выделять что то в пикер вью с выбором пола
        !isFirstResponder
    }
}
