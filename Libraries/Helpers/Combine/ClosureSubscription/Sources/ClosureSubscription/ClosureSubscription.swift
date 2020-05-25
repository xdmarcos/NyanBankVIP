//
//  ClosureSubscription.swift
//  CSVPublisher
//
//  Created by Andris Lejasmeiers on 03/01/2020.
//

import Combine
import Foundation

public final class ClosureSubscription: Subscription {
  public typealias RequestHandlerType = (Subscribers.Demand) -> Void
  public typealias CancelHandlerType = () -> Void

  private let onRequest: RequestHandlerType
  private let onCancel: CancelHandlerType?
  private let lock = NSRecursiveLock()

  public init(request: @escaping RequestHandlerType) {
    onRequest = request
    onCancel = nil
  }

  public init(request: @escaping RequestHandlerType, cancel: @escaping CancelHandlerType) {
    onRequest = request
    onCancel = cancel
  }

  public func request(_ demand: Subscribers.Demand) {
    lock.synchronized {
      onRequest(demand)
    }
  }

  public func cancel() {
    lock.synchronized {
      onCancel?()
    }
  }
}

private extension NSRecursiveLock {
  func synchronized<T>(_ block: () throws -> T) rethrows -> T {
    lock()
    defer { unlock() }
    return try block()
  }
}
