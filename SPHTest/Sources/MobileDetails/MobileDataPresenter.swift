//
//  MobileDataPresenter.swift
//  SPHTest
//
//  Created by Rishi on 6/10/19.
//  Copyright © 2019 Rishi. All rights reserved.
//

import UIKit

protocol PostDetailsPresentationLogic
{
    func presentMobileData(response: [MobileDataFieldsViewModel])
}

class MobileDetailsPresenter: PostDetailsPresentationLogic
{
    
    weak var viewController: MobileDataDisplayLogic?
    
    // MARK: Do something
    
    func presentMobileData(response: [MobileDataFieldsViewModel])
    {
        viewController?.displayMobileData(viewModel: response)
    }
}
