//
//  HomeViewController.swift
//  Beer
//
//  Created by John Lima on 19/05/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet weak private var tableView: UITableView!
  
  // swiftlint:disable weak_delegate
  private var dataSourceAndDelegate: DataSourceAndDelegate?
  
  private var page = 1
  var beers = [Beer]()
  
  // MARK: - Overrides
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
    loadData()
  }
  
  // MARK: - Private Methods
  private func loadData() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    Network.shared.fetchBeers(page: page) { [weak self] beers, _ in
      UIApplication.shared.isNetworkActivityIndicatorVisible = false
      guard let strongSelf = self else { return }
      strongSelf.beers = beers ?? []
      strongSelf.tableView.reloadData()
    }
  }
  
  private func updateUI() {
    
    let footer = UIView(frame: .zero)
    footer.backgroundColor = .white
    tableView.tableFooterView = footer
    
    dataSourceAndDelegate = DataSourceAndDelegate(with: self)
    tableView.dataSource = dataSourceAndDelegate
    tableView.delegate = dataSourceAndDelegate
  }
}
