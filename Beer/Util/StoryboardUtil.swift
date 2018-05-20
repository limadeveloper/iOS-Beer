//
//  StoryboardUtil.swift
//  Beer
//
//  Created by John Lima on 20/05/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import UIKit

struct StoryboardUtil {
  
  static let main = UIStoryboard(name: "Main", bundle: nil)
  
  static func homeNavigationViewController() -> UINavigationController? {
    return main.instantiateViewController(withIdentifier: "HomeNavigationViewController") as? UINavigationController
  }
  
  static func detailsViewController() -> DetailsViewController? {
    return main.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
  }
}
