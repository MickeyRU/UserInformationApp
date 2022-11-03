//
//  EditingTableView.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 31.10.2022.
//

import UIKit

final class EditingTableView: UITableView  {
    
    private var userModel = UserModel()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        register(TextViewTableViewCell.self)
        register(DatePickerTableViewCell.self)
        register(PickerViewTableViewCell.self)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUserModel(_ model: UserModel) {
        userModel = model
    }
    
    public func editUserModel() {
        guard let firstNameCell = self.cellForRow(at: [0,0]) as? TextViewTableViewCell,
              let secondNameCell = self.cellForRow(at: [0,1]) as? TextViewTableViewCell,
              let thirdNameCell = self.cellForRow(at: [0,2]) as? TextViewTableViewCell,
              let birthsdayCell = self.cellForRow(at: [0,3]) as? DatePickerTableViewCell,
              let genderCell = self.cellForRow(at: [0,4]) as? PickerViewTableViewCell else { return }
        
        userModel.firstName = firstNameCell.getCellValue()
        userModel.secondName = secondNameCell.getCellValue()
        userModel.thirdName = thirdNameCell.getCellValue()
        userModel.birthsday = birthsdayCell.getCellValue()
        userModel.gender = genderCell.getCellValue()
    }
    
    public func getUserModel() -> UserModel {
        editUserModel()
        return userModel
    }
}

//MARK: - UItableViewDataSource

extension EditingTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Resources.FieldsName.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // CaseIterable в перечислении позволяет обратиться по индексу строки к значениям перечисления
        let fieldName = Resources.FieldsName.allCases[indexPath.row].rawValue
        
        switch indexPath.row {
        case 0...2:
            guard let cell = self.dequeuReusableCell(TextViewTableViewCell.self) else {
                return UITableViewCell()
            }
            
            cell.nameTextViewDelegate = self
            
            switch indexPath.row {
            case 0:
                cell.configure(fieldName, scrollEnable: true, value: userModel.firstName)
            case 1:
                cell.configure(fieldName, scrollEnable: false, value: userModel.secondName)
            default:
                cell.configure(fieldName, scrollEnable: true, value: userModel.thirdName)
            }
            return cell
        case 3:
            guard let cell = self.dequeuReusableCell(DatePickerTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.configure(fieldName, date: userModel.birthsday.getDateFromString())
            return cell
        case 4:
            guard let cell = self.dequeuReusableCell(PickerViewTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.configure(fieldName, value: userModel.gender)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//MARK: - UItableViewDelegate

extension EditingTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Настраиваем размер второй ячейки - чтобы ячейка увеличивалась автоматически
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

extension EditingTableView : NameTextViewProtocol {
    func changeSize() {
        beginUpdates()
        endUpdates()
    }
}


