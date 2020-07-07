//
//  UIImageView+Extension.swift
//  AboutCanada
//
//  Created by Ayan Khan on 05/07/20.
//  Copyright © 2020 Mohd Prophet. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

public enum ResultImage<T> {
    case success(T)
    case failure(Error)
}

final class ImageDownloader: NSObject {
    
    private static func getData(url: URL,
                                completion: @escaping (Data?, URLResponse?, Error?) -> ())
    {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    public static func downloadImage(url: URL,
                                     completion: @escaping (ResultImage<Data>) -> Void)
    {
        
        ImageDownloader.getData(url: url) { data, response, error in
        
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async() {
                completion(.success(data))
            }
        }
    }
}

extension UIImageView{
    func setImageFromUrl(urlSting: String) {
        
        guard let url = URL(string: urlSting) else { return }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlSting as AnyObject) {
            image = imageFromCache as? UIImage
            return
        }
        
        ImageDownloader.downloadImage(url: url) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                guard let imageToCache = UIImage(data: data) else { return }
                imageCache.setObject(imageToCache, forKey: urlSting as AnyObject)
                self.image = UIImage(data: data)
            case .failure(_):
                DispatchQueue.main.async() {
                   self.backgroundColor = UIColor.lightGray
                }
            }
            
        }
        
    }

}
