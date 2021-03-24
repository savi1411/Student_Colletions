//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Carlos Alberto Savi on 19/03/21.
//

import Foundation
import UIKit

class PhotoInfoController {
    
    enum PhotoInfoError: Error, LocalizedError {
        case imageDataMissing
    }
    
    func fetchPhotoInfo(completion: @escaping (Result<PhotoInfo,
                                                      Error>) -> Void) {
        var urlComponents = URLComponents(string:
                                            "https://api.nasa.gov/planetary/apod")!
        urlComponents.queryItems = [
            "api_key": "DEMO_KEY",
        ].map { URLQueryItem(name: $0.key, value: $0.value) }
//        print(urlComponents.url)
        let task = URLSession.shared.dataTask(with:
                                                urlComponents.url!) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let photoInfo = try
                        jsonDecoder.decode(PhotoInfo.self, from: data)
                    completion(.success(photoInfo))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func fetchImage(from url: URL, completion: @escaping
       (Result<UIImage, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data,
           response, error) in
            if let data = data, let image = UIImage(data: data) {
                completion(.success(image))
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(PhotoInfoError.imageDataMissing))
            }
        }
    
        task.resume()
    }

    
}
