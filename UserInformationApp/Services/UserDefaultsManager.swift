//
//  UserDefaultsManager.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 31.10.2022.
//

import Foundation

final class UserDefaultsManager {
    
    private static let defaults = UserDefaults.standard
    private static let userSessionKey = "userKey"
    
    static func getUserDictionary() -> [String : String] {
        defaults.value(forKey: userSessionKey) as? [String : String] ?? [:]
    }
    
    static func saveUserValue(_ key: String, _ value: String) {
        var userDictionary = getUserDictionary()
        userDictionary[key] = value
        defaults.set(userDictionary, forKey: userSessionKey)
    }
    
    static func getUserModel() -> UserModel {
        var userModel = UserModel()
        let userDictionary = getUserDictionary()
        userModel.firstName = userDictionary[Resources.FieldsName.firstName.rawValue] ?? ""
        userModel.secondName = userDictionary[Resources.FieldsName.secondName.rawValue] ?? ""
        userModel.thirdName = userDictionary[Resources.FieldsName.thirdName.rawValue] ?? ""
        userModel.birthsday = userDictionary[Resources.FieldsName.birthDay.rawValue] ?? ""
        userModel.gender = userDictionary[Resources.FieldsName.gender.rawValue] ?? ""
        return userModel
    }
    
    static func getUserValue(_ key: String) -> String {
        let userDictionary = getUserDictionary()
        let stringValue = userDictionary[key] ?? ""
        return stringValue
    }
}
