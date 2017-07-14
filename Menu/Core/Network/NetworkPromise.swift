//
//  Promise.swift
//  Menu
//
//  Created by Tran Thien Khiem on 12/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//
import UIKit

/// network error enum
enum NetworkError: Error {
    case InvalidResponse
}

/// a network connection promise
class NetworkPromise {
    
    /// the request to run
    var request: URLRequest
    
    /// The error handler if set
    var errorHandler: ErrorHandler?
    
    /// Create a network request promise
    ///
    /// - Parameters:
    ///   - request: the request to send
    init(request: URLRequest) {
        self.request = request
    }
    
    /// Execute call back
    ///
    /// - Parameter success: the callback handler
    /// - Parameter error: handle when error
    func then(success successHandler: @escaping (Data) -> Void) {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
            
            runOnMain {
                if let error = error {
                    self.errorHandler?(error)
                } else {
                    successHandler(data!)
                }
            }
        }
        
        task.resume()
    }
}

/// extension for network
extension NetworkPromise {
    
    
    /// then success and return string
    ///
    /// - Parameter successHandler: success handler
    func then(success successHandler: @escaping (Bool) -> ()) {
        
        then(success: {
            (data: Data) in
            let string = String(data: data, encoding: .utf8)!
            successHandler(string.lowercased() == "true")
        })
    }
    
    /// then success and return string
    ///
    /// - Parameter successHandler: <#successHandler description#>
    func then(success successHandler: @escaping (String) -> ()) {
        
        then(success: {
            (data: Data) in
            let string = String(data: data, encoding: .utf8)!
            successHandler(string)
        })
    }
    
    
    func then<DataType>(success successHandler: @escaping (DataType) -> Void)
        where DataType: Decodable {
            then(success: {
                (data: Data) in
                let decoder = JSONDecoder()
                
                // debugging purpose
                let string = String(data: data, encoding: .utf8)!
                print(string)
                
                do {
                    let decodedData = try decoder.decode(DataType.self, from: data)
                    successHandler(decodedData)
                } catch (let error) {
                    self.errorHandler?(error)
                }
            })
    }
}
