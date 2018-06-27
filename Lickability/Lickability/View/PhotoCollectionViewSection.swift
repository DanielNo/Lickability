//
//  PhotoCollectionViewSection.swift
//  Lickability
//
//  Created by Daniel No on 6/27/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RxDataSources

struct PhotoCollectionViewSection {
    var header: String
    var items: [Item]
    
}


extension PhotoCollectionViewSection : AnimatableSectionModelType {
    typealias Item = Photo
    
    typealias Identity = String
    
    var identity: String {
        return header
    }
    
    init(original: PhotoCollectionViewSection, items: [Photo]) {
        self = original
        self.items = items
    }
    
    
}
