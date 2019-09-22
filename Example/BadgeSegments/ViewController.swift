//
//  ViewController.swift
//  BadgeSegments
//
//  Created by morteza.ghrdi@gmail.com on 09/22/2019.
//  Copyright (c) 2019 morteza.ghrdi@gmail.com. All rights reserved.
//

import UIKit
import BadgeSegments
class ViewController: UIViewController, BadgeSegmentDelegate {

    @IBOutlet weak var badgeSegment: BadgeSegments!
    override func viewDidLoad() {
        super.viewDidLoad()


        let items = [SegmentItem(title: "first",isSelected: false,badgeNumber: 20),SegmentItem(title: "second",isSelected: true),SegmentItem(title: "third",isSelected: false,badgeNumber: 12)]
        badgeSegment.appearence = .standard
        badgeSegment.delegate = self
        badgeSegment.setUpSegments(with: items)
    }
    func didSelectSegment(with index: Int) {
        print(index)
    }
    
    
    @IBAction func changeValues(_ sender: Any) {
        badgeSegment.setTitle(inIndex: 0, title: "hello")
        badgeSegment.setSelected(inIndex: 2)
        badgeSegment.setBadgeNumber(inIndex: 1, badgeNum: 12)
    }
    
}

