//
//  MobileDataPresenterTests.swift
//  SPHTestTests
//
//  Created by Rishi on 7/10/19.
//  Copyright © 2019 Rishi. All rights reserved.
//

@testable import SPHTest
import XCTest


class MobileDataPresenterTests : XCTestCase
{
  // MARK: Subject under test
  
  var sut: MobileDetailsPresenter!
  var posts: [MobileDataFieldsViewModel] = []

  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupPostDetailsPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupPostDetailsPresenter()
  {
    sut = MobileDetailsPresenter()
  }
  
  // MARK: Test doubles
  
  class MobileDataDisplayLogicSpy: MobileDataDisplayLogic
  {
    var displayPostCalled = false
    
    func displayMobileData(viewModel: [MobileDataFieldsViewModel])
    {
      displayPostCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentPosts()
  {
    // Given
    let spy = MobileDataDisplayLogicSpy()
    sut.viewController = spy
    let data =  MobileDataFieldsViewModel(volume: "23.2333" , quarter: "2016" , id:  0, volumeDataDecrease: true)
         posts.append(data)
    // When
    sut.presentMobileData(response: posts)
    
    // Then
    XCTAssertTrue(spy.displayPostCalled, "PresentPosts() should ask the view controller to display the result")
  }
}

