//
//  MobileDetailViewControllerTests.swift
//  SPHTestTests
//
//  Created by Rishi on 7/10/19.
//  Copyright © 2019 Rishi. All rights reserved.
//

@testable import SPHTest
import XCTest

class MobileDataViewControllerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: MobileDataViewController!
    var window: UIWindow!
    var posts: [MobileDataFieldsViewModel] = []

    // MARK: Test lifecycle
    
    override func setUp()
    {
      super.setUp()
      window = UIWindow()
      setupMobileDataViewController()
    }
    
    override func tearDown()
    {
      window = nil
      super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMobileDataViewController()
    {
      sut = MobileDataViewController()
    }
    
    func loadView()
    {
      window.addSubview(sut.view)
      RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class MobileDataBusinessLogicSpy: MobileDataDetailsBusinessLogic
    {
        var fetchPostCalled = false

        func fetchMobileData(request: MobileDataDetails.Data.Request) {
            fetchPostCalled = true

        }
    }
    
    func testfetchMobileData()
    {
      // Given
      let spy = MobileDataBusinessLogicSpy()
      sut.interactor = spy
      sut.fetchMobileData()
      // When
      loadView()
      
      // Then
      XCTAssertTrue(spy.fetchPostCalled, "viewDidLoad() should ask the interactor to do fetch posts")
    }
    
    func testDisplayMobileData()
    {
        //Given
       let data =  MobileDataFieldsViewModel(volume: "23.2333" , quarter: "2016" , id:  0, volumeDataDecrease: true)
        posts.append(data)
        //when
        loadView()
        sut.displayMobileData(viewModel: posts )
        
        // Then
        XCTAssertEqual(posts.count, 1)
    }
    
    
}
