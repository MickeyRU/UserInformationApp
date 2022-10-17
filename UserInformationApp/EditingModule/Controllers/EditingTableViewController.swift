//
//  EditingTableViewController.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 17.10.2022.
//

import UIKit

class EditingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .red
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.idMainTableViewCell)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать", style: .plain, target: self, action: #selector(editButtonTapped))
    }
    
    @objc private func editButtonTapped() {
        print("tap")
    }
}

//MARK: - UItableViewDataSource

extension EditingTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Resources.FieldsName.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.idMainTableViewCell, for: indexPath) as? MainTableViewCell else { return UITableViewCell()
        }
        
        // CaseIterable в перечислении позволяет обратиться по индексу строки к значениям перечисления
        let fieldName = Resources.FieldsName.allCases[indexPath.row].rawValue
        cell.configure(fieldName)
        return cell
    }
}

//MARK: - UItableViewDelegate

extension EditingTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Настраиваем размер второй ячейки - чтобы ячейка увеличивалась автоматически
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

