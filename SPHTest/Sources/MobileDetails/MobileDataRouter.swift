//
//  MobileDataRouter.swift
//  SPHTest
//
//  Created by Rishi on 6/10/19.
//  Copyright © 2019 Rishi. All rights reserved.
//

import UIKit

@objc protocol MobileDetailsRoutingLogic
{
  func routeToSomewhere()
}

protocol MobileDetailsDataPassing
{
  var dataStore: MobileDetailsDataStore? { get }
}

class MobileDetailsRouter: NSObject, MobileDetailsRoutingLogic, MobileDetailsDataPassing
{
  weak var viewController: MobileDataViewController?
  var dataStore: MobileDetailsDataStore?
  
  // MARK: Routing
  
  func routeToSomewhere()
  {
//      let storyboard = UIStoryboard(name: "Main", bundle: nil)
//      let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
//      var destinationDS = destinationVC.router!.dataStore!
//      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//      navigateToSomewhere(source: viewController!, destination: destinationVC)
  }

  // MARK: Navigation
  
//  func navigateToSomewhere(source: PostDetailsViewController, destination: SomewhereViewController)
//  {
//    source.show(destination, sender: nil)
//  }
  
  // MARK: Passing data
  
//  func passDataToSomewhere(source: PostDetailsDataStore, destination: inout SomewhereDataStore)
//  {
//    destination.posts = source.posts
//  }
}
