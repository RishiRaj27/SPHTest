//
//  MobileDataInteractorTests.swift
//  SPHTestTests
//
//  Created by Rishi on 7/10/19.
//  Copyright © 2019 Rishi. All rights reserved.
//

@testable import SPHTest
import XCTest


class MobileDataInteractorTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: MobileDataInteractor!

  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupMobileDataInteractor()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupMobileDataInteractor()
  {
    sut = MobileDataInteractor()
  }
  
  // MARK: Tests
  
  func testfetchPosts()
  {
    let presenterSpy = MobileDetailPresentationLogicSpy()
    sut.presenter = presenterSpy
    let worker = PostDetailsWorker()
    sut.worker = worker
    sut.fetchMobileData(request: MobileDataDetails.Data.Request())
    let expectations = expectation(description: "The api request is successful")
    worker.fetchMobileData(completion: {response,error in
        XCTAssertNil(error, "Api request return some error")
        expectations.fulfill()
        //since presenter need some time to present response just after receiving response
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            XCTAssertTrue(presenterSpy.presentPostsCalled, "fetchPosts() should ask the presenter to present the post")
        }
    })
    waitForExpectations(timeout: 30, handler: { (error) in
        if let error = error {
            XCTAssertNil(error, "The api request does not give response")
        }
    })
  }
}


class MobileDetailPresentationLogicSpy: PostDetailsPresentationLogic{
    var presentPostsCalled = false

    func presentMobileData(response: [MobileDataFieldsViewModel]) {
        presentPostsCalled = true

    }
    
}
