//
//  SegmentItem.swift
//  BadgeSegment
//
//  Created by Morteza on 9/18/19.
//  Copyright © 2019 Morteza. All rights reserved.
//

import UIKit
protocol SegmentItems {
    var badgeNumber: Int { get set }
    var title: String { get set }
    var isSelected: Bool {get set}
}

public struct SegmentItem: SegmentItems {
    var title: String
    var isSelected: Bool
    var badgeNumber: Int
    
   public init(title:String, isSelected: Bool,badgeNumber: Int = 0) {
        self.title = title
        self.isSelected = isSelected
        self.badgeNumber = badgeNumber
    }

}
