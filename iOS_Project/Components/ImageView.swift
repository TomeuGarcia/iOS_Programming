//
//  ImageView.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 22/3/24.
//

import Foundation
import UIKit


class ImageView : UIImageView {
    
    
    private static let NonSecureDelegate = NonSecureCallDelegate()
    
    private static let ImageSession: URLSession = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        
        let session = URLSession(configuration: config,
                                 delegate: NonSecureDelegate,
                                 delegateQueue: OperationQueue.current)
        
        return session
    }()
    
    
    private var currentTask: URLSessionDataTask? = nil
    
    
    func setImageAsync(url: URL) {
        
        currentTask?.cancel()
        
        currentTask =
        ImageView.ImageSession.dataTask(with: url,
                                        completionHandler: { imageData, response, error in
            if let imageData = imageData {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        })
     
        currentTask?.resume()
    }
    
    
    
    
    private class NonSecureCallDelegate : NSObject, URLSessionDelegate {
        
        public func urlSession(
            _ session: URLSession,
            didReceive challenge: URLAuthenticationChallenge,
            completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) 
            -> Void) {
            
                if let serverTrust = challenge.protectionSpace.serverTrust {
                    completionHandler(.useCredential, URLCredential(trust: serverTrust))
                }
        }
        
    }

    
}
