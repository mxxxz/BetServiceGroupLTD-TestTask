//
//  StatisticController.swift
//  BetServiceGroupLTD TestTask
//
//  Created by Dmitry Grusha on 06/11/2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

enum CellsId:String{
    case viewsCellId = "ViewsCell"
    case likesCellId = "LikesCell"
    case commentatorsCellId = "CommentatorsCell"
    case mentionsCellId = "MentionsCell"
    case repostsCellId = "RepostsCell"
    case bookmarksCellId = "BookmarksCell"
}
enum Titles:String,CaseIterable{
    case views = "Просмотры"
    case likes = "Лайки"
    case commentators = "Комментаторы"
    case mentions = "Отметки"
    case reposts = "Репосты"
    case bookmarks = "Закладки"
}

class StatisticController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    let arrayWithUrls = ["https://api.inrating.top/v1/users/posts/likers/all","https://api.inrating.top/v1/users/posts/commentators/all","https://api.inrating.top/v1/users/posts/mentions/all","https://api.inrating.top/v1/users/posts/reposters/all"]
    
    var CountArray = [Int](repeating: 0, count: 6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Статистика поста"
        
        handleCounts()
        
        collectionViewSetup()
        
        collectionViewCellsRegister()
    }
    private func collectionViewSetup(){
        collectionView.backgroundColor = UIColor.rgb(r: 214, g: 214, b: 218)
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    private func collectionViewCellsRegister(){
        collectionView.register(ViewsCell.self, forCellWithReuseIdentifier: CellsId.viewsCellId.rawValue)
        collectionView.register(LikesCell.self, forCellWithReuseIdentifier: CellsId.likesCellId.rawValue)
        collectionView.register(CommentatorsCell.self, forCellWithReuseIdentifier: CellsId.commentatorsCellId.rawValue)
        collectionView.register(MentionsCell.self, forCellWithReuseIdentifier: CellsId.mentionsCellId.rawValue)
        collectionView.register(RepostsCell.self, forCellWithReuseIdentifier: CellsId.repostsCellId.rawValue)
        collectionView.register(BookmarksCell.self, forCellWithReuseIdentifier: CellsId.bookmarksCellId.rawValue)
    }
    
}

