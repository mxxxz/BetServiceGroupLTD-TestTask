//
//  LikesCell.swift
//  BetServiceGroupLTD TestTask
//
//  Created by Dmitry Grusha on 06/11/2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit


class LikesCell:BaseCell,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var likesArray = [Content]()
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        
        cv.delegate = self
        cv.dataSource = self
        
        return cv
    }()
    
    private func request(){
        let sharedNetwork = Network.shared
        sharedNetwork.networkRequest(url: "https://api.inrating.top/v1/users/posts/likers/all", model: 2, PD1onSUCCESS: { (nil) in}, PD2onSUCCESS: { (nil) in}) { (content) in
            DispatchQueue.main.async {
                self.likesArray.append(content)
                self.collectionView.reloadData()
            }
        }
    }
    
    override func setupViews() {
        
        request()
        
        addSubview(collectionView)
        //Anchors
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        collectionView.register(LikeCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LikeCell
        
        let like = likesArray[indexPath.item]
        
        cell.imageView.loadImageUsingCacheWithUrlString(urlString: like.urlString)
        cell.nameLabel.text = like.nickname
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.height - 20
        return CGSize(width: width, height: collectionView.frame.height)
    }
}

class LikeCell:BaseCell {
    
    let imageView:UIImageView = {
       let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let nameLabel:UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        
        return label
    }()
    
    override func setupViews() {
        
        addSubview(imageView)
        //Anchors
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        addSubview(nameLabel)
        //Anchors
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
    }
}
