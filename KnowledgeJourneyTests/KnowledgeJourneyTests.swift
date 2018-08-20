//
//  KnowledgeJourneyTests.swift
//  KnowledgeJourneyTests
//
//  Created by Suhayb Al-Absi on 8/20/18.
//  Copyright © 2018 Suhayb Al-Absi. All rights reserved.
//

import XCTest

class KnowledgeJourneyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        assert(true, "Testing assert in sample unit test")
    }
    
    func testPerformanceExample() {
        
        
        self.measure {
            for i in 0 ... 100 {
                print("Hello, World !")
            }
        }
    }
    
}
