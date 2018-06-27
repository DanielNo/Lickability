//
//  PhotosAPI.swift
//  Lickability
//
//  Created by Daniel No on 6/25/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation
import Alamofire

public class PhotosAPI{

    
    func getPhotos(completion: @escaping (Data?, URLResponse?, Error?) -> ()) -> Void{
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/photos") else{
         return
        }
        let urlRequest = NSURLRequest(url: url)
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            completion(data,response,error)
        }
        task.resume()
        
        
    }

}
