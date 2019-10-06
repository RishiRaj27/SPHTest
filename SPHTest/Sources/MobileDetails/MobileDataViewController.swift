//
//  MobileDataViewController.swift
//  SPHTest
//
//  Created by Rishi on 6/10/19.
//  Copyright © 2019 Rishi. All rights reserved.
//

import UIKit

protocol MobileDataDisplayLogic: class
{
    func displayMobileData(viewModel: [MobileDataFieldsViewModel])
}

class MobileDataViewController: UITableViewController, MobileDataDisplayLogic {
    
    var interactor: MobileDataDetailsBusinessLogic?
    var router: (NSObjectProtocol & MobileDetailsRoutingLogic & MobileDetailsDataPassing)?
    var postData:[MobileDataFieldsViewModel]?
    private func setup()
      {
          let viewController = self
          let interactor = MobileDataInteractor()
          let presenter = MobileDetailsPresenter()
          let router = MobileDetailsRouter()
          viewController.interactor = interactor
          viewController.router = router
          interactor.presenter = presenter
          presenter.viewController = viewController
          router.viewController = viewController
          router.dataStore = interactor
          
      }
    override func viewDidLoad() {
      super.viewDidLoad()
      setup()
      self.tableView.register(MobileDataCellTableViewCell.self, forCellReuseIdentifier: "MobileDataCellTableViewCell")
      tableView.rowHeight = UITableView.automaticDimension
      tableView.estimatedRowHeight = 44
        self.fetchMobileData()
      navigationItem.title = "Mobile Data Usage"
      let refreshControl = UIRefreshControl()
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.addSubview(refreshControl)
        }
      refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    // MARK: fetchPosts
    
    func fetchMobileData()
    {
        let request = MobileDataDetails.Data.Request()
        interactor?.fetchMobileData(request: request)
        refreshControl?.endRefreshing()
    }
    
    func displayMobileData(viewModel: [MobileDataFieldsViewModel])
    {
        postData = viewModel
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func refreshData() {
       self.postData?.removeAll()
       tableView.reloadData()
       self.fetchMobileData()
      
        
    }

}

extension MobileDataViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.postData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "MobileDataCellTableViewCell", for: indexPath) as! MobileDataCellTableViewCell
        cell.setUpData(data: (self.postData?[indexPath.row])!)
        return cell
    }
}
