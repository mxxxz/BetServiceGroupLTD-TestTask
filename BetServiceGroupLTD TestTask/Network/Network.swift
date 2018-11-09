//
//  Network.swift
//  BetServiceGroupLTD TestTask
//
//  Created by Dmitry Grusha on 07/11/2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Alamofire

class Network{
    
    private init(){}
    static let shared = Network()
    
    
    func networkRequest(url:String,model:Int,PD1onSUCCESS: @escaping(PostData1)->(),PD2onSUCCESS: @escaping(Int)->(),UDonSUCCESS: @escaping(Content)->()){
        
        let urlString =  "\(url)?\(id)"
        
        guard let url = URL(string: urlString) else {return}

        request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (responce) in
                
                let decoder = JSONDecoder()
                
                do{
                    
                    guard let data = responce.data else {return}
                    //convert from snake
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    //define model
                    
                    switch model{
                    case 0:
                        let json = try decoder.decode(PostData1.self, from: data)
                        PD1onSUCCESS(json)
                    case 1:
                        let json = try decoder.decode(PostData2.self, from: data)
                        PD2onSUCCESS(json.meta.total)
                    case 2:
                        let json = try decoder.decode(UsersData.self, from: data)
                        for i in json.data {
                            let nickname = i.nickname
                            let avatarString = i.avatarImage.urlSmall
                            let success = Content(nickname: nickname, urlString: avatarString)
                            UDonSUCCESS(success)
                        }
                    default:
                        break
                    }
                }catch{
                    print("Error")
                }
                
            }
        }
}
