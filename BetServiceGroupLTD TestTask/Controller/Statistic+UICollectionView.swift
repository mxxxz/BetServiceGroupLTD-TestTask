//
//  Statistic+UICollectionView.swift
//  BetServiceGroupLTD TestTask
//
//  Created by Dmitry Grusha on 08/11/2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension StatisticController{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = handleCurrentCell(forIndexPath: indexPath, item: indexPath.item)
        
        let title = Titles.allCases[indexPath.item].rawValue
        
        cell.titleLabel.text = title
        
        cell.countLabel.text = String(CountArray[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //static width for all cells
        let width = view.frame.width - 15
        //default height for first and last cells
        if indexPath.item == 0 || indexPath.item == 5{
            return CGSize(width: width, height: 30)
        }else{
            
            if CountArray[indexPath.item] != 0 {
                return CGSize(width: width, height: 140)
            }else{
                return CGSize(width: width, height: 30)
            }
        }
    }
}
