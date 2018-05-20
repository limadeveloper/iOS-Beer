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
  private let kRowHeight: CGFloat = 130
  private let kTimeIntervalToDismissAlertWarning: TimeInterval = 5
  
  // MARK: - Properties
  private var controller: HomeViewController?
  private var alertWarningAboutConnection: UIAlertController?
  private var timer = Timer()
  
  // MARK: - Initializers
  init(with controller: HomeViewController) {
    super.init()
    self.controller = controller
  }
  
  // MARK: - Private Methods
  @objc private func dismissAlert() {
    alertWarningAboutConnection?.dismiss(animated: true) { [weak self] in
      guard let strongSelf = self else { return }
      strongSelf.timer.invalidate()
    }
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
    return kRowHeight
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let detailsViewController = StoryboardUtil.detailsViewController() else { return }
    detailsViewController.beer = controller?.beers[indexPath.row]
    controller?.navigationController?.pushViewController(detailsViewController, animated: true)
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let items = controller?.beers, items.count > Int() else { return }
    let lastIndex = items.count - 1
    if indexPath.item == lastIndex, let controller = controller {
      guard Network.shared.isConnectedToInternet() else {
        alertWarningAboutConnection = AlertUtil.showAlertWarningAboutInternetConnection(in: controller)
        timer = Timer.scheduledTimer(timeInterval: kTimeIntervalToDismissAlertWarning, target: self, selector: #selector(dismissAlert), userInfo: nil, repeats: false)
        return
      }
      controller.loadData {
        controller.tableView.reloadData()
      }
    }
  }
}
