//
//  CSVReaderSpec.swift
//  CSVPublisher
//
//  Created by Andris Lejasmeiers on 17/12/2019.
//  Copyright © 2019 SIA GrottiApps. All rights reserved.
//

import Combine
import CombineExpectations
import CSV
import Nimble
import Quick
import XCTest

@testable import CSVPublisher

final class CSVReaderSpec: QuickSpec {
  private enum Sample {
    enum SCV {
      static let headed = "foo,bar\n1,A\n2,B\n3,C"
      static let headless = "1,A\n2,B"
    }

    struct Row: Equatable, Decodable {
      let foo: Int
      let bar: String

      static let headed = [
        Self(foo: 1, bar: "A"),
        Self(foo: 2, bar: "B"),
        Self(foo: 3, bar: "C"),
      ]
      static let headless = [
        Self(foo: 1, bar: "A"),
        Self(foo: 2, bar: "B"),
      ]
    }
  }

  // swiftlint:disable:next function_body_length
  override func spec() {
    describe("rowPublisher") {
      var csv: CSVReader!
      var publisher: AnyPublisher<Sample.Row, Error>!

      describe("with headed CSV") {
        context("when header row is disabled") {
          beforeEach {
            // swiftlint:disable:next force_try
            csv = try! CSVReader(string: Sample.SCV.headed, hasHeaderRow: false)
            publisher = csv.rowPublisher(decodable: Sample.Row.self)
          }

          it("header row is nil") {
            expect(csv.headerRow).to(beNil())
          }

          context("without subscribers") {
            it("current row is nil") {
              expect(csv.currentRow).to(beNil())
            }
          }

          context("a subscription") {
            it("fails with error") {
              // swiftformat:disable:next trailingClosures
              expect({
                // swiftlint:disable:next force_try
                guard case .failure = try! self.wait(for: publisher.record().completion) else {
                  return .failed(reason: "wrong enum case")
                }
                return .succeeded
              }).to(succeed())
            }
          }
        }

        context("when header row is enabled") {
          beforeEach {
            // swiftlint:disable:next force_try
            csv = try! CSVReader(string: Sample.SCV.headed, hasHeaderRow: true)
            publisher = csv.rowPublisher(decodable: Sample.Row.self)
          }

          it("header row equals to sample") {
            expect(csv.headerRow).to(equal(["foo", "bar"]))
          }

          context("without subscribers") {
            it("current row is nil") {
              expect(csv.currentRow).to(beNil())
            }
          }

          context("a subscriber") {
            it("receives elements equal to headed sample") {
              expect { try self.wait(for: publisher.record().elements) }
                .to(equal(Sample.Row.headed))
            }

            it("receives elements only once") {
              expect { try self.wait(for: publisher.record().elements) }
                .toNot(beEmpty())

              expect { try self.wait(for: publisher.record().elements) }
                .to(beEmpty())
            }
          }
        }
      }

      describe("with headless CSV") {
        context("when header row is disabled") {
          beforeEach {
            // swiftlint:disable:next force_try
            csv = try! CSVReader(string: Sample.SCV.headless, hasHeaderRow: false)
            publisher = csv.rowPublisher(decodable: Sample.Row.self)
          }

          context("a subscription") {
            it("fails with error") {
              // swiftformat:disable:next trailingClosures
              expect({
                // swiftlint:disable:next force_try
                guard case .failure = try! self.wait(for: publisher.record().completion) else {
                  return .failed(reason: "wrong enum case")
                }
                return .succeeded
              }).to(succeed())
            }
          }
        }

        context("when header row is enabled") {
          beforeEach {
            // swiftlint:disable:next force_try
            csv = try! CSVReader(string: Sample.SCV.headless, hasHeaderRow: true)
            publisher = csv.rowPublisher(decodable: Sample.Row.self)
          }

          it("header row equals to sample") {
            expect(csv.headerRow).to(equal(["1", "A"]))
          }

          context("a subscription") {
            it("fails with error") {
              // swiftformat:disable:next trailingClosures
              expect({
                // swiftlint:disable:next force_try
                guard case .failure = try! self.wait(for: publisher.record().completion) else {
                  return .failed(reason: "wrong enum case")
                }
                return .succeeded
              }).to(succeed())
            }
          }
        }
      }
    }
  }
}

private extension XCTestCase {
  func wait<R: PublisherExpectation>(
    for publisherExpectation: R,
    description: String = ""
  ) throws -> R.Output {
    try wait(for: publisherExpectation, timeout: 0.01, description: description)
  }
}
