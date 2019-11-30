//
//  NetworkService.swift
//  AddressApp
//
//  Created by Mac1 on 11/30/19.
//  Copyright © 2019 Mac1. All rights reserved.
//

import Foundation

fileprivate struct NetworkConstants {
    static var requestLocationURL = "https://nominatim.openstreetmap.org/reverse.php?"
}

class NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    func requestLocation(with location:PostLocation, completion: @escaping (ResponseLocation?, Error?) -> Void) {
        let urlString = "\(NetworkConstants.requestLocationURL)format=json&lat=\(location.latitude)&lon=\(location.longitude)"
        guard let url = URL(string: urlString) else {
            completion(nil, NetworkError.WrongURL)
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil, NetworkError.WrongData)
                return
            }
            
            do {
                let responseLocation = try JSONDecoder().decode(ResponseLocation.self, from: data)
                    completion(responseLocation, nil)
            } catch {
                completion(nil, NetworkError.JSONError)
            }
        }
        task.resume()
    }
}
