//
//  HttpClientTest.swift
//  MenuTests
//
//  Created by Tran Thien Khiem on 12/7/17.
//  Copyright © 2017 Tran Thien Khiem. All rights reserved.
//

import XCTest
@testable import Menu

struct Post: Codable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}

class HttpClientTest: XCTestCase {
    
    /// the http client
    var client = HttpClient(base: "https://jsonplaceholder.typicode.com")
    
    /// Test get post
    func testGet() {
        let expectation = XCTestExpectation()
        
        client.get("/posts")
            .then {
                (data: [Post]) in
                
                print(data)
                
                expectation.fulfill()
            }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    /// test post
    func testPost() {
        let expectation = XCTestExpectation()
        let post = Post(id: 0, userId: 12, title: "Sample Post", body: "Text")
        
        client.onError {
            error in
            
            print(error)
            expectation.fulfill()
        }
        
        client.post("/posts", body: post)
              .then {
                (data: Post) in
                
                print(data)
                
                expectation.fulfill()
            }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
