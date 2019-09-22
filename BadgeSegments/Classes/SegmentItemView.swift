//
//  SegmentItemView.swift
//  BadgeSegment
//
//  Created by Morteza on 9/18/19.
//  Copyright © 2019 Morteza. All rights reserved.
//

import UIKit

class SegmentItemView: UIView {
    var appearence: BSAppearence!
    var badgeNumber: Int = 0 {
        didSet {
            if badgeNumber == 0 {
                badgeLabel.isHidden = true
            }else {
                badgeLabel.text = String(badgeNumber)
                badgeLabel.isHidden = false
            }
        }
    }
   fileprivate var selectorView = UIView()
    
   fileprivate var titleLabel = UILabel()
   fileprivate var badgeLabel = UILabel()
    var isSelected: Bool = false{
        didSet{
            setLabelStatus()
        }
    }
    var labelTappedHandler: (() -> Void)?
    var title: String = "" {
        didSet{
            self.titleLabel.text = title
            self.titleLabel.textAlignment = .center
        }
    }
    
    
    
     func setUpSubviews(){
        self.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        self.addSubview(titleLabel)
        self.addSubview(badgeLabel)
        self.addSubview(selectorView)

        self.layer.cornerRadius = 5

        //title label Constraints setup
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: self.frame.height - 1).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: self.frame.width - 1).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.isUserInteractionEnabled = true
        titleLabel.contentMode = .bottom
        
        //badge label Constraints and property setup
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        badgeLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        badgeLabel.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        badgeLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: -5).isActive = true
        badgeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        badgeLabel.backgroundColor = .red
        badgeLabel.layer.cornerRadius = 10
        badgeLabel.clipsToBounds = true
        badgeLabel.textAlignment = .center
        badgeLabel.font = .systemFont(ofSize: 11)
        badgeLabel.textColor = .white
        
        //Selector view setup
        
        if appearence == .underlined {
            selectorView.translatesAutoresizingMaskIntoConstraints = false
            selectorView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
            selectorView.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
            selectorView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            selectorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            selectorView.backgroundColor = .black
            
        }
        
        addtapGestureToLabel()
    }
    
   fileprivate func addtapGestureToLabel(){
        let tapG = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        self.titleLabel.addGestureRecognizer(tapG)
        
    }
    
   fileprivate func setLabelStatus(){
        if self.appearence == .standard {
            self.selectorView.isHidden = true
            if self.isSelected {
                self.backgroundColor = .black
                self.titleLabel.textColor = .white
            }else {
                self.backgroundColor = .white
                self.titleLabel.textColor = .black
            }
        }else{
            self.backgroundColor = .clear
            self.titleLabel.textColor = .black
            if self.isSelected {
                self.selectorView.isHidden = false
            }else {
                self.selectorView.isHidden = true

            }
        }
        
        
        
    }
    
    @objc fileprivate func labelTapped(){
            self.labelTappedHandler!()
    }
    
    
}
