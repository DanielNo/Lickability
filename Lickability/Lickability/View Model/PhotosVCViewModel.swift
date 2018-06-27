//
//  PhotosVCViewModel.swift
//  Lickability
//
//  Created by Daniel No on 6/25/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation
import RxSwift

public class PhotosVCViewModel{
    let api : PhotosAPI
    let photos: Variable<[Photo]> = Variable([])

    
    init(api : PhotosAPI) {
        self.api = api
    }
    
    func getPhotos(completion : @escaping (Error?) -> ()){
        self.api.getPhotos { [unowned self](data, response, responseError) in
            if let jsonData = data{
                do{
                    print(jsonData)
                    var photos = try JSONDecoder().decode([Photo].self, from: jsonData)
                    self.photos.value = photos
                    completion(nil)
                }catch{
                    completion(responseError)
                    print(error.localizedDescription)
                }
            }

            
            
            
            
        }
        
        
    }
}
