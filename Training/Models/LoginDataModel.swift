//
//  LoginDataModel.swift
//  Training
//
//  Created by IOS on 16/08/21.
//

import Foundation
// MARK: - LoginModel
struct LoginModel: Codable {
    let success: Bool
    let message: String
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let token: String?
}

