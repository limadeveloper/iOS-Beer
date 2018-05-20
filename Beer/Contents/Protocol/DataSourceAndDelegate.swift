//
//  DataSourceAndDelegate.swift
//  Beer
//
//  Created by John Lima on 19/05/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import UIKit
import AlamofireImage

class DataSourceAndDelegate: NSObject {
  
  // MARK: - Constants
  private let rowHeight: CGFloat = 130
  
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
    let cell: HomeTableViewCell = tableView.dequeueReusableCell(for: indexPath)
    cell.beer = self.controller?.beers[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return rowHeight
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
