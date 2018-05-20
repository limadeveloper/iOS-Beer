//
//  Beer.swift
//  Beer
//
//  Created by John Lima on 19/05/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import Foundation

struct Beer: Codable {
  
  let id: Int
  let name: String
  let description: String
  let imageURL: String
  
  private enum CodingKeys: String, CodingKey {
    case id, name, description
    case imageURL = "image_url"
  }
}
