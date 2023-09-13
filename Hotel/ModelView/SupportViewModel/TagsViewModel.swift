//
//  TagsViewModel.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import Foundation
import SwiftUI

class TagsViewModel: ObservableObject {
    let items: [String]
    @Published private(set) var groupedItems: [[String]] = [[]]
    
    init(items: [String]) {
        self.items = items
        groupedItems = createGroupedItems(items: items)
    }
    
    func createGroupedItems(items: [String]) -> [[String]] {
        var groupedItems: [[String]] = [[]]
        var tempItems: [String] = []
        var width: CGFloat = 0
        
        for item in items {
            let label = UILabel()
            label.text = item
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 16
            
            if (width + labelWidth) < UIScreen.main.bounds.width {
                width += labelWidth
                tempItems.append(item)
            } else {
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(item)
            }
        }
        groupedItems.append(tempItems)
        return groupedItems
    }
}
