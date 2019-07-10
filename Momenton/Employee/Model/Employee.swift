//
//  Employee.swift
//  Momenton
//
//  Created by Wael Saad - r00tdvd on 9/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import UIKit
import Foundation

public struct Employee: Codable, Hashable {
    public let id: Int?
    public let employeeName: String?
    public let managerId: Int?

    public var employeeHierarchicalLevel: Int = 0
    
    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case employeeName = "Employee Name"
        case managerId = "Manager Id"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        employeeName = try values.decodeIfPresent(String.self, forKey: .employeeName)
        managerId = try values.decodeIfPresent(Int.self, forKey: .managerId)
    }
}
