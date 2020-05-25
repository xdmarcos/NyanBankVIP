//
//  PersonsCSVLoader.swift
//  NyanBank
//
//  Created by Andris Lejasmeiers on 06/01/2020.
//  Copyright © 2020 Andris Lejasmeiers. All rights reserved.
//

import Combine
import CSV
import CSVPublisher
import Foundation

public struct PersonsCSVLoader {
  let bundle: Bundle

  public init(bundle: Bundle = Bundle.main) {
    self.bundle = bundle
  }
}

extension PersonsCSVLoader: PersonsProvider {
  public func loadResource(name: String) -> AnyPublisher<Person, Error> {
    pathForResource(name: name)
      .flatMap { self.stream(for: $0) }
      .flatMap { self.reader(stream: $0) }
      .flatMap { $0.rowPublisher(decodable: Person.self, decoder: self.decoder) }
      .eraseToAnyPublisher()
  }
}

private extension PersonsCSVLoader {
  var formatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    return formatter
  }

  var decoder: CSVRowDecoder {
    let decoder = CSVRowDecoder()
    decoder.dateDecodingStrategy = .formatted(formatter)
    return decoder
  }

  func pathForResource(name: String) -> Future<String, Error> {
    Future {
      if let path = self.bundle.path(forResource: name, ofType: "csv") {
        return $0(.success(path))
      }
      $0(.failure(PersonsCSVLoaderError.invalidPath))
    }
  }

  func stream(for path: String) -> Future<InputStream, Error> {
    Future {
      if let stream = InputStream(fileAtPath: path) {
        return $0(.success(stream))
      }
      $0(.failure(PersonsCSVLoaderError.failedToOpenStream))
    }
  }

  func reader(stream: InputStream) -> Future<CSVReader, Error> {
    Future {
      do {
        $0(.success(try CSVReader(stream: stream, hasHeaderRow: true)))
      } catch {
        $0(.failure(error))
      }
    }
  }
}
