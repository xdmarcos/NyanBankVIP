//
//  RowPublisher.swift
//  CSVPublisher
//
//  Created by Andris Lejasmeiers on 03/01/2020.
//

import ClosureSubscription
import Combine
import CSV

final class RowPublisher<T: Decodable>: Publisher {
  typealias Output = T
  typealias Failure = Error
  typealias Reader = CSVReader
  typealias Decoder = CSVRowDecoder

  let reader: Reader
  let decoder: Decoder

  init(reader: Reader, decoder: Decoder) {
    self.reader = reader
    self.decoder = decoder
  }

  func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
    subscriber.receive(subscription: ClosureSubscription { [weak self] demand in
      guard let self = self else { return }

      if case .none = demand {
        return subscriber.receive(completion: .finished)
      }

      do {
        var index = 0
        while self.reader.next() != nil, index < demand {
          let row = try self.decoder.decode(Output.self, from: self.reader)
          _ = subscriber.receive(row)
          index += 1
        }
      } catch {
        return subscriber.receive(completion: .failure(error))
      }

      subscriber.receive(completion: .finished)
    })
  }
}
