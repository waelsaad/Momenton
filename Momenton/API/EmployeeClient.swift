//
//  EmployeeClient.swift
//  Momenton
//
//  Created by Wael Saad - r00tdvd on 9/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import Foundation

class EmployeeClient {
    typealias T = [Employee]

    public func fetchEmployees( completion: @escaping (Result<T, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: Constants.employeesJSONFileName, ofType: Constants.JSON) else { return }
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let employees = try decoder.decode([Employee].self, from: data)
            completion(.success(employees))
            
        } catch {
            print(error)
        }
    }
}

extension EmployeeClient {
    struct Constants {
        static let JSON = "json"
        static let employeesJSONFileName = "employee"
    }
}

