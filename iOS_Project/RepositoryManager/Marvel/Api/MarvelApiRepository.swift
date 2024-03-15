//
//  MarvelApiRepository.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 15/3/24.
//

import Foundation
import CryptoKit


class MarvelApiRepository : MarvelRepository {
    
    
    class MarvelURLComponents {
        
        private static let baseURL: String = "https://gateway.marvel.com:443/v1/public"
        
        private static let privateKey: String = "59aabdde5b6ca4284e80ef9f66b4a91c1361f079"
        private static let publicKey: String = "c8ae9bc5f09309b25a74332110233d6d"
        
        private var components: URLComponents?
        public var Components: URLComponents? {
            get { return components }
        }
        
        enum SubPath : String {
            case Characters = "characters"
            case Comics = "comics"
            case Series = "series"
            case Stories = "stories"
        }
        
        
        init() {
            self.components = URLComponents(string: MarvelURLComponents.baseURL)
            
            let timeStamp = String(Date().timeIntervalSince1970)
            let hash = MarvelURLComponents.MarvelMD5(
                string: "\(timeStamp)\(MarvelURLComponents.privateKey)\(MarvelURLComponents.publicKey)"
            )
            
            self.components?.queryItems = [
                URLQueryItem(name: "apikey", value: MarvelURLComponents.publicKey),
                URLQueryItem(name: "ts",     value: timeStamp),
                URLQueryItem(name: "hash",   value: hash),
            ]
        }
        
        
        @discardableResult
        func addToPath(_ subPath : SubPath) -> MarvelURLComponents {
            self.components?.path += "/" + subPath.rawValue
            return self
        }
        
        // Alternative to addToPath()
        static func += (components: MarvelURLComponents, subPath: SubPath) {
            components.addToPath(subPath)
        }
        
        
        @discardableResult
        func addLimit(_ limit: Int) -> MarvelURLComponents {
            self.components?.queryItems?.append(URLQueryItem(name: "limit", value: String(limit)))
            return self
        }
        
        @discardableResult
        func addOffset(_ offset: Int) -> MarvelURLComponents {
            self.components?.queryItems?.append(URLQueryItem(name: "offset", value: String(offset)))
            return self
        }
        
        
        
        static func MarvelMD5(string: String) -> String {
            let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
            return digest.map {
                String(format: "%02hhx", $0)
            }.joined()
        }
        
    }
    
    

    
    
    
}
