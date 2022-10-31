//
//  EditingTableViewController.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 17.10.2022.
//

import UIKit

class EditingViewController: UIViewController {
    
    private let editingTableView = EditingTableView()
    
    private var userModel = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrainrs()
    }
    
    init(_ userModel: UserModel) {
        self.userModel = userModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        title = "Редактирование"
        view.backgroundColor = .white
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveTapped))
        
        let backBarButtonItem = UIBarButtonItem.createCustomButton(vc: self, selector: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backBarButtonItem
        view.addViews(editingTableView)

    }
     
    @objc private func saveTapped() {
        if authFields() {
            presentSimpleAlert(title: "Выполнено", message: "Все обязательные поля заполнены")
        } else {
            presentSimpleAlert(title: "Ошибка", message: "Заполните поля: ФИО, дата рождения, пол")
        }
    }
    
    @objc private func backButtonTapped() {
        presentSaveAlert { value in
            if value {
                // model
                self.navigationController?.popViewController(animated: true)
            } else {
                self.navigationController?.popViewController(animated: true) // возвращаемся назад
            }
        }
    }
    private func authFields() -> Bool {
        if userModel.firstName != "" ||
            userModel.secondName != "" ||
            userModel.birthsday != "" ||
            userModel.gender != "" ||
            userModel.gender != "Не указано" {
            return true
        }
        return false
    }
}

extension EditingViewController {
    
    private func setConstrainrs(){
        
        NSLayoutConstraint.activate([
            editingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            editingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            editingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            editingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

