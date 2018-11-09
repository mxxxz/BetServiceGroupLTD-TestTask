//
//  Statistic+handlers.swift
//  BetServiceGroupLTD TestTask
//
//  Created by Dmitry Grusha on 08/11/2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//
import UIKit

extension StatisticController{
    
    func handleCounts(){
        let sharedNetwork = Network.shared
        sharedNetwork.networkRequest(url: "https://api.inrating.top/v1/users/posts/get", model: 0, PD1onSUCCESS: { (data) in
            self.CountArray[0] = data.viewsCount
            self.CountArray[5] = data.bookmarksCount
            
            for i in 0..<4{
                sharedNetwork.networkRequest(url: self.arrayWithUrls[i], model: 1, PD1onSUCCESS: { (nil) in}, PD2onSUCCESS: { (data) in
                    self.CountArray[1+i] = data
                    self.collectionView.reloadData()
                }, UDonSUCCESS: { (nil) in})
            }
            
            
        }, PD2onSUCCESS: { (nil) in}) { (nil) in}
    }
    
    func handleCurrentCell(forIndexPath indexPath: IndexPath, item: IndexPath.ArrayLiteralElement)->BaseCell{
        switch item {
        case 1:
            return collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.likesCellId.rawValue, for: indexPath) as! LikesCell
        case 2:
            return collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.commentatorsCellId.rawValue, for: indexPath) as! CommentatorsCell
        case 3:
            return collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.mentionsCellId.rawValue, for: indexPath) as! MentionsCell
        case 4:
            return collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.repostsCellId.rawValue, for: indexPath) as! RepostsCell
        case 5:
            return collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.bookmarksCellId.rawValue, for: indexPath) as! BookmarksCell
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.viewsCellId.rawValue, for: indexPath) as! ViewsCell
        }
    }
}
