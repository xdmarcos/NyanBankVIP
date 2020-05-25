//
//  PersonsCSVLoaderError.swift
//  NyanBank
//
//  Created by Andris Lejasmeiers on 06/01/2020.
//  Copyright © 2020 Andris Lejasmeiers. All rights reserved.
//

import Foundation

public enum PersonsCSVLoaderError: Error {
  case invalidPath
  case failedToOpenStream
}

extension PersonsCSVLoaderError: LocalizedError {
  public var errorDescription: String? {
    "The operation couldn't be completed."
  }

  public var failureReason: String? {
    switch self {
    case .invalidPath:
      return "Invalid path."
    case .failedToOpenStream:
      return "Failed to open stream."
    }
  }
}
