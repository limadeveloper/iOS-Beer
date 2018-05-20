//
//  AlertUtil.swift
//  Beer
//
//  Created by John Lima on 20/05/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import UIKit

private let kAlertButtonDone = "Ok"
private let kErrorNoConnection = "No connection"
private let kErrorCheckConnection = "Check your internet connection and try again"

struct AlertUtil {
  
  static func createAlert(title: String? = nil, message: String? = nil, style: UIAlertControllerStyle = .alert, actions: [UIAlertAction]? = [UIAlertAction(title: kAlertButtonDone, style: .cancel, handler: nil)], target: UIViewController?, isPopover: Bool = false, buttonItem: UIBarButtonItem? = nil) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: style)
    
    if let actions = actions {
      for action in actions {
        alert.addAction(action)
      }
    }
    
    if isPopover {
      alert.modalPresentationStyle = .popover
      alert.isModalInPopover = true
      let popover = alert.popoverPresentationController
      popover?.barButtonItem = buttonItem
      popover?.sourceRect = CGRect(x: CGFloat(), y: 10, width: CGFloat(), height: CGFloat())
      popover?.backgroundColor = .white
    }
    
    DispatchQueue.main.async {
      target?.present(alert, animated: true, completion: nil)
    }
  }
  
  static func showAlertWarningAboutInternetConnection(in target: UIViewController) -> UIAlertController {
    let alert = UIAlertController(title: "☹︎ \(kErrorNoConnection)", message: kErrorCheckConnection, preferredStyle: UIDevice.current.userInterfaceIdiom == .pad ? .alert : .actionSheet)
    DispatchQueue.main.async {
      target.present(alert, animated: true, completion: nil)
    }
    return alert
  }
}
