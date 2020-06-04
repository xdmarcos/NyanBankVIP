//
//  PersonsCSVLoader.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import CSV
import CSVImporter
import Foundation

public struct PersonsCSVLoader {
  let bundle: Bundle

  public init(bundle: Bundle = Bundle.main) {
    self.bundle = bundle
  }
}

extension PersonsCSVLoader: PersonsProvider {
  public func loadResource(name: String) -> Result<[Person], Error> {
    pathForResource(name: name)
      .flatMap { stream(for: $0) }
      .flatMap { reader(stream: $0) }
      .flatMap { $0.dataImporter(decodable: Person.self, decoder: decoder) }
  }
}

// MARK: Private
private extension PersonsCSVLoader {
  func pathFor(name: String) -> String {
    return name
  }
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

  func pathForResource(name: String) -> Result<String, Error> {
    if let path = bundle.path(forResource: name, ofType: "csv") {
      return .success(path)
    }
    return .failure(PersonsCSVLoaderError.invalidPath)
  }

  func stream(for path: String) -> Result<InputStream, Error> {
    if let stream = InputStream(fileAtPath: path) {
      return .success(stream)
    }
    return .failure(PersonsCSVLoaderError.failedToOpenStream)
  }

  func reader(stream: InputStream) -> Result<CSVReader, Error> {
    do {
      return .success(try CSVReader(stream: stream, hasHeaderRow: true))
    } catch {
      return .failure(error)
    }
  }
}
