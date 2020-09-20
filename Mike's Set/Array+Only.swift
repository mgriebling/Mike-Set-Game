//
//  Array+Only.swift
//  Memorize
//
//  Created by Michael Griebling on 9/17/20.
//  Copyright © 2020 Computer Inspirations. All rights reserved.
//

import Foundation

extension Array {
    
    var only: Element? {
        count == 1 ? first : nil
    }
    
}
