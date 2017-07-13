//
//  HttpClient.swift
//  Menu
//
//  Created by Tran Thien Khiem on 12/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import Foundation

enum Method: String {
    case Get
    case Post
    case Put
    case Patch
    case Delete
}

/// The error handler
typealias ErrorHandler = (Error) -> Void

/// The typical http client
class HttpClient {
    
    /// the base endpoint
    var base: String
    
    /// the error handler
    var errorHandler: ErrorHandler?
    
    /// initialize a http client with an end point
    ///
    /// - Parameter base: base url to the resource
    init(base: String = "") {
        self.base = base
    }
    
    
    /// Handle when error
    ///
    /// - Parameter handler: the handler
    func onError(handler: @escaping ErrorHandler) {
        errorHandler = handler
    }
    
    /// Send a request to url
    ///
    /// - Parameters:
    ///   - method: method of the request, either Get / Post /Put /Pacth
    ///   - endPoint: the endpoint to connect
    ///   - body: body of the request
    /// - Returns: a promise
    func request(method: Method, endPoint: String, body: Data? = nil) -> NetworkPromise {
        
        let url = URL(string: "\(base)\(endPoint)")!
        var request = URLRequest(url: url)
            
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = method.rawValue
            
        if let body = body {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = body
        }
            
        let promise = NetworkPromise(request: request)
        promise.errorHandler = errorHandler
        
        return promise
    }
}

// MARK: - Extension for other method of http client
extension HttpClient {
    
    /// Send a request with body is an object
    ///
    /// - Parameters:
    ///   - method: method of the request, either Get / Post /Put /Pacth
    ///   - url: the endpoint to connect to
    ///   - body: body of the request
    /// - Returns: a promise
    func request<DataType>(method: Method, endPoint: String, body: DataType) -> NetworkPromise
        where DataType: Encodable
    {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(body)
        return request(method: method, endPoint: endPoint, body: data)
    }
    
    /// send a get request
    ///
    /// - Parameter _: the end point
    /// - Returns: a network promise
    func get(_ endPoint: String) -> NetworkPromise {
        return request(method: .Get, endPoint: endPoint)
    }
    
    
    /// Send a post request
    ///
    /// - Parameters:
    ///   - endPoint: the endpoint
    ///   - body: data to send as body
    /// - Returns: the netowrk promise
    func post<DataType>(_ endPoint: String, body: DataType) -> NetworkPromise
    where DataType: Encodable {
        return request(method: .Post, endPoint: endPoint, body: body)
    }
    
    /// Send a put request
    ///
    /// - Parameters:
    ///   - endPoint: the endpoint
    ///   - body: data to send as body
    /// - Returns: the netowrk promise
    func put<DataType>(_ endPoint: String, body: DataType) -> NetworkPromise
        where DataType: Encodable {
            return request(method: .Put, endPoint: endPoint, body: body)
    }
    
    /// Send a patch request
    ///
    /// - Parameters:
    ///   - endPoint: the endpoint
    ///   - body: data to send as body
    /// - Returns: the netowrk promise
    func patch<DataType>(_ endPoint: String, body: DataType) -> NetworkPromise
        where DataType: Encodable {
            return request(method: .Patch, endPoint: endPoint, body: body)
    }
    
    /// send a delete request
    ///
    /// - Parameter _: the end point
    /// - Returns: a network promise
    func delete(_ endPoint: String) -> NetworkPromise {
        return request(method: .Delete, endPoint: endPoint)
    }
}
