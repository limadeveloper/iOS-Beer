//
//  TypeAlias.swift
//  Beer
//
//  Created by John Lima on 19/05/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import Foundation

struct CompletionBlock {
  typealias FetchBeers = ([Beer]?, Error?) -> Void
  typealias Empty = () -> Void
}

struct DataType {
  typealias JSON = [AnyHashable: Any?]
}
