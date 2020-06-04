//
//  CSVImporter.swift
//  CSVImporter
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import CSV

final class CSVImporter<T: Decodable> {
  typealias Output = T
  typealias Failure = Error

  let reader: CSVReader
  let decoder: CSVRowDecoder

  init(reader: CSVReader, decoder: CSVRowDecoder) {
    self.reader = reader
    self.decoder = decoder
  }

  func `import`() -> Result<[Output], Error> {
    var rows: [Output] = []
    do {
      while reader.next() != nil {
        let row = try decoder.decode(Output.self, from: reader)
        rows.append(row)
      }
    } catch {
      return .failure(error)
    }

    return .success(rows)
  }
}
