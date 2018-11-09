//
//  Like.swift
//  BetServiceGroupLTD TestTask
//
//  Created by Dmitry Grusha on 07/11/2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Foundation

struct UsersData:Codable {
    let data:[UserData]
}

struct UserData:Codable {
    let nickname:String
    let avatarImage: AvatarImage
}

struct AvatarImage:Codable {
    let urlSmall:String
}

