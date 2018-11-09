//
//  PostData.swift
//  BetServiceGroupLTD TestTask
//
//  Created by Dmitry Grusha on 07/11/2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Foundation

struct PostData1:Codable {
    let bookmarksCount:Int
    let viewsCount:Int
}

struct PostData2:Codable {
    let meta: Total
}

struct Total:Codable {
    let total:Int
}
