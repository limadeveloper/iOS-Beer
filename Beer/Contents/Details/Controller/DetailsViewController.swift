//
//  DetailsViewController.swift
//  Beer
//
//  Created by John Lima on 20/05/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailsViewController: UIViewController {
  
  // MARK: - Constants
  private let nameText = "Name: "
  private let taglineText = "\nTagline: "
  private let alcoholLevelText = "\nAlcohol level: "
  private let ibuText = "\nIBU: "
  private let descriptionText = "\nDescription: "
  private let fontSize: CGFloat = 18
  
  // MARK: - Properties
  @IBOutlet weak private var photoImageView: UIImageView!
  @IBOutlet weak private var detailsTextView: UITextView!
  
  var beer: Beer?
  
  // MARK: - Overrides
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    updateUI()
  }
  
  // MARK: - Private Methods
  private func updateUI() {
    
    guard let beer = beer else {
      detailsTextView.text = nil
      return
    }
    
    photoImageView.af_setImage(withURL: URL(string: beer.imageURL)!)
    
    let fontAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize, weight: .medium)]
    let attributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize, weight: .medium), NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.862745098, green: 0.631372549, blue: 0.1411764706, alpha: 1)]
    
    let attributedString = NSMutableAttributedString(string: nameText, attributes: attributes)
    attributedString.append(NSAttributedString(string: beer.name, attributes: fontAttribute))
    attributedString.append(NSAttributedString(string: taglineText, attributes: attributes))
    attributedString.append(NSAttributedString(string: beer.tagline, attributes: fontAttribute))
    attributedString.append(NSAttributedString(string: alcoholLevelText, attributes: attributes))
    attributedString.append(NSAttributedString(string: String(beer.alcoholLevel), attributes: fontAttribute))
    attributedString.append(NSAttributedString(string: ibuText, attributes: attributes))
    attributedString.append(NSAttributedString(string: String(beer.bitternessScale), attributes: fontAttribute))
    attributedString.append(NSAttributedString(string: descriptionText, attributes: attributes))
    attributedString.append(NSAttributedString(string: beer.description, attributes: fontAttribute))
    
    detailsTextView.attributedText = attributedString
    detailsTextView.textAlignment = .center
    detailsTextView.setContentOffset(.zero, animated: true)
  }
}
