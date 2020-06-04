//
//  PersonsProvider.swift
//
//
//  Created by xdmgzdev on 02/06/2020.
//

public protocol PersonsProvider {
  func loadResource(name: String) -> Result<[Person], Error>
}
