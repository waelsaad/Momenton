//
//  EmployeeTableViewCell.swift
//  Momenton
//
//  Created by Wael Saad - r00tdvd on 9/6/19.
//  Copyright © 2019 r00tdvd. All rights reserved.
//

import UIKit

final class EmployeeTableViewCell: UITableViewCell, ViewWithNib, Reusable {
    
    // MARK: - Lifecycle
    
    @IBOutlet weak var weightLosssProgressBarStackView: UIStackView!
    @IBOutlet weak var strengthProgressBarStackView: UIStackView!
    @IBOutlet weak var muscleProgressBarStackView: UIStackView!
    @IBOutlet weak var flexibilityProgressBarStackView: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var heroImageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = UIColor.clear
            containerView.layer.shadowOpacity = Constants.shadowOpacity
            containerView.layer.shadowRadius = Constants.shadowRadius
            containerView.layer.shadowColor = UIColor.gray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        }
    }
    
    @IBOutlet weak var clippingView: UIView! {
        didSet {
            clippingView.layer.masksToBounds = true
            clippingView.layer.cornerRadius = Constants.radius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Configure View
    
    override func layoutSubviews() {
        

    }
    
    func configure(with employee: Employee) {

    }
}

extension EmployeeTableViewCell {
    struct Constants {
        static let radius: CGFloat = 5
        static let progressViewWidth: CGFloat = 1.2
        static let progressViewHeight: CGFloat = 4
        static let progressBarMaximumValue: Float = 5
        static let shadowOpacity: Float = 0.5
        static let shadowRadius: CGFloat = 3
    }
}
