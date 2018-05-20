//
//  DataSourceAndDelegate.swift
//  Beer
//
//  Created by John Lima on 19/05/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import UIKit

class DataSourceAndDelegate: NSObject {
  
  // MARK: - Properties
  private var controller: HomeViewController?
  
  // MARK: - Initializers
  init(with controller: HomeViewController) {
    super.init()
    self.controller = controller
  }
}

// MARK: - Extensions
extension DataSourceAndDelegate: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return controller?.beers.count ?? Int()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
