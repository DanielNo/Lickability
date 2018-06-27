//
//  Photo.swift
//  Lickability
//
//  Created by Daniel No on 6/26/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources


struct Photo : Decodable{
    let albumId : Int?
    let id : Int
    let title : String?
    let url : String?
    let thumbnailUrl : String?
}

extension Photo : IdentifiableType, Equatable{
    typealias Identity = Int
    
    var identity : Identity { return id }
    
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
    
}

