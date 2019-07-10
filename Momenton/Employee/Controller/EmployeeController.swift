//
//  EmployeeController.swift
//  Momenton
//
//  Created by Wael Saad - r00tdvd on 9/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import UIKit

class EmployeeController: AccordionTableViewController {

    private var viewModel: EmployeeViewModel = EmployeeViewModel(client: EmployeeClient())

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchEmployees() { result in  }
        self.populateTable()
    }
    
    func printDictionary(dictionary:  [Employee: [Employee]] ) {

        print ("\n\n")
        
        dictionary.keys.sorted(by: { $0.employeeHierarchicalLevel < $1.employeeHierarchicalLevel }).forEach { value in
            
            guard let managerName = value.employeeName else { return }
            
            print("Manager Name: ", managerName, " - Manager Level: ", value.employeeHierarchicalLevel)
            
            print("========================================================")
            
            let employees = dictionary[value]
            
            var employeeList: [String] = []

            employees?.forEach { value in
                
                guard let employeeName = value.employeeName else { return }
                
                employeeList.append(employeeName)
                
                print("Employee Name: ", employeeName, " - Employee Level: ", value.employeeHierarchicalLevel)
            }
            
            let managerWithEmployees = Parent(state: .collapsed, childs: employeeList, title: managerName + " - Manager")
            
            dataSource == nil ? dataSource = [managerWithEmployees] : dataSource.addObjectIfNew(managerWithEmployees)

            print ("\n")
            
            print("========================================================")
        }
    }
    
    func populateTable() {
        printDictionary(dictionary: viewModel.employeeDictionary)
        numberOfCellsExpanded = .several
        total = dataSource.count
        tableView.reloadData()
    }
}


// MARK: - Constants

extension EmployeeController {
    struct Constants {
        static let defaultCellHeight: CGFloat = 500
        static let estimatedHeaderRowHeight: CGFloat = 48.0
    }
}
