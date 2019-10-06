//
//  MobileDataWorkerTests.swift
//  SPHTestTests
//
//  Created by Rishi on 7/10/19.
//  Copyright © 2019 Rishi. All rights reserved.
//

@testable import SPHTest
import XCTest

class PostDetailsWorkerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: PostDetailsWorker!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupPostDetailsWorker()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupPostDetailsWorker()
  {
    sut = PostDetailsWorker()
  }
  
  
  func testfetchPosts()
  {
    let expectations = expectation(description: "The Response result match the expected results")

    sut.fetchMobileData { (response, error) in
        XCTAssertEqual((response?.result?.records)![0]._id, 1)
         expectations.fulfill()
    }
    
    waitForExpectations(timeout: 20, handler: { (error) in
        if let error = error {
            XCTAssertNil(error, "The api request does not fullfill the expectaion")
        }
    })
  }
}
