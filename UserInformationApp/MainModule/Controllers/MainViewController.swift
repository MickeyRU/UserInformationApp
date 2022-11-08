//
//  ViewController.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 16.10.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let userPhotoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let mainTableView = MainTableView()
    
    private var userModel = UserModel()
    
    override func viewWillLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserModel()
        setupViews()
        setConstraints()
        setValueArray()
    }

    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать", style: .plain, target: self, action: #selector(editButtonTapped))
        
        view.addViews(userPhotoImageView)
        view.addViews(mainTableView)
    }
    
    @objc private func editButtonTapped() {
        let editingTableViewController = EditingViewController(userModel, userPhoto: userPhotoImageView.image)
        navigationController?.pushViewController(editingTableViewController, animated: true)
    }
    
    private func getUserModel() {
        userModel = UserDefaultsManager.getUserModel()
        let userPhoto = UserDefaultsManager.loadUserImage()
        userPhotoImageView.image = userPhoto
    }
    
    private func saveEditModel(_ model: UserModel) {
        UserDefaultsManager.saveUserValue(Resources.FieldsName.firstName.rawValue, model.firstName)
        UserDefaultsManager.saveUserValue(Resources.FieldsName.secondName.rawValue, model.secondName)
        UserDefaultsManager.saveUserValue(Resources.FieldsName.thirdName.rawValue, model.thirdName)
        UserDefaultsManager.saveUserValue(Resources.FieldsName.birthDay.rawValue, model.birthsday)
        UserDefaultsManager.saveUserValue(Resources.FieldsName.gender.rawValue, model.gender)
    }
    
    private func getValueArray() -> [String] {
        var valueArrray = [String]()
        
        for key in Resources.FieldsName.allCases {
            let value = UserDefaultsManager.getUserValue(key.rawValue)
            valueArrray.append(value)
        }
        return valueArrray
    }
    
    private func setValueArray() {
        let valueArray = getValueArray()
        mainTableView.setValueArray(valueArray)
        mainTableView.reloadData()
    }
    
    public func changeUserModel(_ model: UserModel) {
        // save model
        saveEditModel(model)
        
        //update labels
        userModel = model
        setValueArray()
        mainTableView.reloadData()
    }
    
    public func changeUserImage(_ image: UIImage?) {
        userPhotoImageView.image = image
        guard let userPhoto = image else { return }
        UserDefaultsManager.saveUserImage(image: userPhoto)
    }
}

//MARK: - Set Constraints

extension MainViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            mainTableView.topAnchor.constraint(equalTo: userPhotoImageView.bottomAnchor, constant: 10),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

