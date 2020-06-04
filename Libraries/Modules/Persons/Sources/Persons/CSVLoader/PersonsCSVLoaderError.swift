//
//  PersonsCSVLoaderError.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
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
