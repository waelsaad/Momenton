//
//
//  AGL
//
//  Created by Wael Saad on 1/11/18.
//  Copyright © 2017 AGL. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {
    mutating func addObjectIfNew(_ item: Element) {
        if !contains(item) {
            append(item)
        }
    }
}
