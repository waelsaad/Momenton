//
//  EmployeeViewModel.swift
//  Momenton
//
//  Created by Wael Saad - r00tdvd on 9/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import Foundation

protocol EmployeeViewModelType {

    var CEO: Employee! { get }

    var data: [Employee] { get }
    
    var employeeDictionary:  [Employee: [Employee]] { get set }

    func fetchEmployees(completion: @escaping (Result<[Employee], Error>) -> Void)
}

class EmployeeViewModel: EmployeeViewModelType {
    
    var data: [Employee] {
        return allData
    }

    var CEO: Employee! {
        return allData.filter { $0.managerId == 0}.first
    }
    
    var employeeHierarchicalMaximumLevel: Int = 0
    
    var employeeDictionary: Dictionary<Employee, [Employee]> = [:]
    
    func buildEmployeeHierarchicalStructure (employee: Employee, level: Int) -> Void {
        for i in 0 ..< allData.count {
            var currentEmployee = allData[i]
            if currentEmployee.managerId == employee.id {
                currentEmployee.employeeHierarchicalLevel = level + 1
                (employeeDictionary[employee] == nil) ? employeeDictionary[employee] = [currentEmployee] : employeeDictionary[employee]?.append(currentEmployee)
                self.buildEmployeeHierarchicalStructure(employee: currentEmployee, level: level + 1)
            }
        }
    }
    
    
    init(client: EmployeeClient) {
        self.client = client
    }

    func fetchEmployees(completion: @escaping (Result<[Employee], Error>) -> Void) {
        client.fetchEmployees() {  result in
            switch result {
            case let .success(response):
                self.allData = response
                self.buildEmployeeHierarchicalStructure(employee: self.CEO, level: 0)
                
                //print("========================================================")
                //print (self.employeeDictionary)
                //print("========================================================")
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
    // Private
    private var client: EmployeeClient
    private var allData: [Employee] = []
}
