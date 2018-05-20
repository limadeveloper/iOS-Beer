//
//  HomeTableViewCell.swift
//  Beer
//
//  Created by John Lima on 19/05/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell, ReusableView {
  
  // MARK: - Constants
  private let alcoholLevelText = "Alcohol level: "
  
  // MARK: - Properties
  @IBOutlet weak private var photo: UIImageView!
  @IBOutlet weak private var name: UILabel!
  @IBOutlet weak private var alcoholLevel: UILabel!
  
  var beer: Beer? {
    didSet {
      guard let beer = beer else { return }
      photo?.af_setImage(withURL: URL(string: beer.imageURL)!)
      name.text = beer.name
      alcoholLevel.text = alcoholLevelText + String(beer.alcoholLevel)
    }
  }
  
  // MARK: - Overrides
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
}
