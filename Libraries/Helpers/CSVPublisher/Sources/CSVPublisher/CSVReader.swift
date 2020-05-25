//
//  CSVReader.swift
//  CSVPublisher
//
//  Created by Andris Lejasmeiers on 09/12/2019.
//

import Combine
import CSV

extension CSVReader {
  public func rowPublisher<T: Decodable>(
    decodable _: T.Type,
    decoder: CSVRowDecoder = CSVRowDecoder()
  ) -> AnyPublisher<T, Error> {
    RowPublisher<T>(reader: self, decoder: decoder).eraseToAnyPublisher()
  }
}
