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
        editingTableView.setUserModel(userModel)
        view.addViews(editingTableView)
        
    }
    
    @objc private func saveTapped() {
        
        let editUserModel = editingTableView.getUserModel()
        print(editUserModel)
        print(userModel)

        if authFields(model: editUserModel) {
            presentSimpleAlert(title: "Выполнено", message: "Все обязательные поля заполнены")
        } else {
            presentSimpleAlert(title: "Ошибка", message: "Заполните поля: ФИО, дата рождения, пол")
        }
        
    }
    
    @objc private func backButtonTapped() {
        
        let editUserModel = editingTableView.getUserModel()
        
        if editUserModel == userModel {
            navigationController?.popViewController(animated: true) // возвращаемся назад
        } else {
            presentSaveAlert { [weak self] value in
                guard let self = self else { return }
                if value {
                    guard let firstVC = self.navigationController?.viewControllers.first as? MainTableViewController else { return }
                    firstVC.changeUserModel(editUserModel)
                    self.navigationController?.popViewController(animated: true)
                } else {
                    self.navigationController?.popViewController(animated: true) // возвращаемся назад
                }
            }
        }
    }
    
    private func authFields(model: UserModel) -> Bool {
        if model.firstName == "Нет данных" ||
            model.secondName == "Нет данных" ||
            model.birthsday == "" ||
            model.gender == "" ||
            model.gender == "Не указано" {
            return false
        }
        return true
    }
}

//MARK: - Set Constraints

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

