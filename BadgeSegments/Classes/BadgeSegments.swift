//
//  BadgeSegment.swift
//  BadgeSegment
//
//  Created by Morteza on 9/18/19.
//  Copyright © 2019 Morteza. All rights reserved.
//

import UIKit

protocol BadgeSegmentDelegate {
    func didSelectSegment(with index:Int)
}

@IBDesignable
class BadgeSegments: UIControl {
    
    fileprivate var items: [SegmentItem]!
    fileprivate var stackView = UIStackView()
    var appearence: BSAppearence = .underlined{
        didSet{
            setUpView()
        }
    }
    fileprivate var selectedIndex: Int = 0
    var titleColor: UIColor = .black
    var underlineColor: UIColor = .black
    var delegate: BadgeSegmentDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
   fileprivate func setUpView(){
        
        // Add border
        if appearence == .standard {
            let borderLayer = CAShapeLayer()
            borderLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 5, height: 5)).cgPath
            borderLayer.strokeColor = UIColor.black.cgColor
            borderLayer.fillColor = UIColor.white.cgColor
            borderLayer.frame = self.bounds
            self.layer.addSublayer(borderLayer)
        }
        
    }
    
    func setBadgeNumber(inIndex index: Int,badgeNum: Int) {
        
        if let bi = self.stackView.arrangedSubviews as? [SegmentItemView] {
                 bi[index].badgeNumber = badgeNum
        }
    }
    
    func setSelected(inIndex index: Int){
        
        if let bi = self.stackView.arrangedSubviews as? [SegmentItemView] {
            bi.forEach {
                $0.isSelected = false
            }
            bi[index].isSelected = true
            self.delegate?.didSelectSegment(with: index)
        }
    }
    
    func setTitle(inIndex index: Int,title: String) {
        if let bi = self.stackView.arrangedSubviews as? [SegmentItemView] {
            bi[index].title = title
        
        }
    }
    
    func setUpSegments(with items: [SegmentItem]){
        self.items = items
        self.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.alignment = .fill
        self.stackView.distribution = .fillEqually
        self.stackView.axis = .horizontal
        
        stackView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.bringSubviewToFront(stackView)
        
        for (index,item) in items.enumerated() {
            let badgeItemView = SegmentItemView(frame: CGRect(x: 0, y: 0, width: self.frame.width / CGFloat(items.count), height: self.frame.height))
            badgeItemView.appearence = self.appearence
            badgeItemView.title = item.title
            badgeItemView.isSelected = item.isSelected
            badgeItemView.setUpSubviews()
            badgeItemView.badgeNumber = item.badgeNumber
            badgeItemView.labelTappedHandler = {
                if let bi = self.stackView.arrangedSubviews as? [SegmentItemView] {
                    bi.forEach({
                        $0.isSelected = false
                    })
                }
                badgeItemView.isSelected = true
                self.selectedIndex = index
                self.delegate?.didSelectSegment(with: index)
            }
            self.stackView.addArrangedSubview(badgeItemView)
        }
        
    }
    
}
