//
//  CSVReader.swift
//  CSVImporter
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//
import CSV

extension CSVReader {
  public func dataImporter<T: Decodable>(
    decodable _: T.Type,
    decoder: CSVRowDecoder = CSVRowDecoder()
  ) -> Result<[T], Error> {
    CSVImporter<T>(reader: self, decoder: decoder).import()
  }
}
