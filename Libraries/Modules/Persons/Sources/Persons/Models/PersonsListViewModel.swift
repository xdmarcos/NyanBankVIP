//
//  PersonListViewModel.swift
//  NyanBank
//
//  Created by Andris Lejasmeiers on 01/01/2020.
//  Copyright © 2020 Andris Lejasmeiers. All rights reserved.
//

import ClosureSubscription
import Combine
import Foundation

public enum PersonsListViewModelError: Error {
  case providerNotProvided
}

public final class PersonListViewModel: ObservableObject {
  private let provider: PersonsProvider?

  @Published var dataSource = [PersonsRowViewModel]()

  public init(provider: PersonsProvider? = nil) {
    self.provider = provider
  }

  public func loadSample(
    name: String,
    ageReferenceDate date: Date = Date(),
    callendar: Calendar = Calendar.current
  ) -> AnyPublisher<Int, Error> {
    var collected = [PersonsRowViewModel]()

    let load = loadResource(name: name, ageReferenceDate: date, callendar: callendar)
      .map { elements -> Int in
        collected.append(contentsOf: elements)
        return collected.count
      }
      .handleEvents(receiveCompletion: { [weak self] completion in
        guard case .finished = completion, let self = self else { return }
        self.dataSource = collected
      })
      .eraseToAnyPublisher()

    return reset()
      .append(load)
      .eraseToAnyPublisher()
  }

  public func clearDataSource() {
    dataSource.removeAll()
  }
}

private extension PersonListViewModel {
  func loadResource(
    name: String,
    ageReferenceDate date: Date,
    callendar: Calendar
  ) -> AnyPublisher<[PersonsRowViewModel], Error> {
    Deferred<AnyPublisher<[PersonsRowViewModel], Error>> { [weak self] in
      guard let self = self else {
        return Empty<[PersonsRowViewModel], Error>()
        .eraseToAnyPublisher()
      }
      guard let provider = self.provider else {
        return Fail(error: PersonsListViewModelError.providerNotProvided)
        .eraseToAnyPublisher()
      }

      var index: Int32 = -1

      return provider
        .loadResource(name: name)
        .map { person in
          OSAtomicIncrement32(&index)
          return PersonsRowViewModel(
            id: index,
            person: person,
            ageReferenceDate: date,
            callendar: callendar
          )
        }
        .subscribe(on: DispatchQueue.global(qos: .utility))
        .collect(.byTime(DispatchQueue.main, .milliseconds(50)))
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    .eraseToAnyPublisher()
  }

  func reset() -> AnyPublisher<Int, Error> {
    Deferred {
      Future<Int, Error> { [weak self] promise in
        self?.dataSource.removeAll()
        promise(.success(0))
      }
      .subscribe(on: DispatchQueue.main)
    }
    .eraseToAnyPublisher()
  }
}
