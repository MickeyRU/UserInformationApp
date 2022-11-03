//
//  ViewController.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 16.10.2022.
//

import UIKit

final class MainTableViewController: UITableViewController {
    
    private var userModel = UserModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserModel()
        setupViews()
    }

    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white
        tableView.register(MainTableViewCell.self)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать", style: .plain, target: self, action: #selector(editButtonTapped))
    }
    
    @objc private func editButtonTapped() {
        let editingTableViewController = EditingViewController(userModel)
        navigationController?.pushViewController(editingTableViewController, animated: true)
    }
    
    private func getUserModel() {
        userModel = UserDefaultsManager.getUserModel()
    }
    
    private func saveEditModel(_ model: UserModel) {
        UserDefaultsManager.saveUserValue(Resources.FieldsName.firstName.rawValue, model.firstName)
        UserDefaultsManager.saveUserValue(Resources.FieldsName.secondName.rawValue, model.secondName)
        UserDefaultsManager.saveUserValue(Resources.FieldsName.thirdName.rawValue, model.thirdName)
        UserDefaultsManager.saveUserValue(Resources.FieldsName.birthDay.rawValue, model.birthsday)
        UserDefaultsManager.saveUserValue(Resources.FieldsName.gender.rawValue, model.gender)
    }
    
    public func changeUserModel(_ model: UserModel) {
        // save model
        saveEditModel(model)
        
        //update labels
        userModel = model
        tableView.reloadData()
    }
}

//MARK: - UItableViewDataSource

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Resources.FieldsName.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        guard let cell = tableView.dequeuReusableCell(MainTableViewCell.self) else {
            return UITableViewCell()
        }
        
        // CaseIterable в перечислении позволяет обратиться по индексу строки к значениям перечисления
        let fieldName = Resources.FieldsName.allCases[indexPath.row].rawValue
        let value = UserDefaultsManager.getUserValue(Resources.FieldsName.allCases[indexPath.row].rawValue)
        cell.configure(name: fieldName, value: value)
        return cell
    }
}

//MARK: - UItableViewDelegate

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Настраиваем размер второй ячейки - чтобы ячейка увеличивалась автоматически
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

