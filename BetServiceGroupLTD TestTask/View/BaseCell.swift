//
//  BaseCell.swift
//  BetServiceGroupLTD TestTask
//
//  Created by Dmitry Grusha on 06/11/2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class BaseCell:UICollectionViewCell{
    
    let titleLabel:UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    let countLabel:UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        backgroundColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(titleLabel)
        //Anchors
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        addSubview(countLabel)
        //Anchors
        countLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 5).isActive = true
        countLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){}
}

