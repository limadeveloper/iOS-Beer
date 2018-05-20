//
//  HomeViewController.swift
//  Beer
//
//  Created by John Lima on 19/05/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Constants
  private let kPageIncrement = 1
  private let kInitialPage = 1
  
  // MARK: - Properties
  @IBOutlet weak var tableView: UITableView!
  
  // swiftlint:disable weak_delegate
  private var dataSourceAndDelegate: DataSourceAndDelegate?
  
  private var page = 1
  var beers = [Beer]()
  
  // MARK: - Overrides
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
    loadData { [weak self] in
      guard let strongSelf = self else { return }
      strongSelf.tableView.reloadData()
    }
  }
  
  // MARK: - Private Methods
  private func updateUI() {
    
    let footer = UIView(frame: .zero)
    footer.backgroundColor = .white
    tableView.tableFooterView = footer
    
    dataSourceAndDelegate = DataSourceAndDelegate(with: self)
    tableView.dataSource = dataSourceAndDelegate
    tableView.delegate = dataSourceAndDelegate
  }
  
  // MARK: - Public Methods
  func loadData(completion: @escaping CompletionBlock.Empty) {
    if beers.count == Int() || page == kInitialPage {
      beers = [Beer]()
    }
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    if Network.shared.isConnectedToInternet() {
      Network.shared.fetchBeers(page: page) { [weak self] beers, _ in
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        guard let strongSelf = self else { completion(); return }
        if let items = beers, items.count > Int() {
          strongSelf.beers.append(contentsOf: items)
          if let noDuplicates = strongSelf.beers.noDuplicates() {
            strongSelf.beers = noDuplicates
          }
          strongSelf.page += strongSelf.kPageIncrement
        }
        completion()
      }
    } else {
      completion()
    }
  }
}
