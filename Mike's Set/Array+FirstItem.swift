//
//  Array+FirstItem.swift
//  Memorize
//
//  Created by Michael Griebling on 9/17/20.
//  Copyright © 2020 Computer Inspirations. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    
    func firstIndex(matching: Element)  -> Int? {
        for index in 0 ..< self.count {
            if self[index].id == matching.id {
                return index
            }
        }        
        return nil
    }
    
}
