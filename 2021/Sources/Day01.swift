import Foundation
import Shared

struct Day01: AdventDay {
  var data: String

  private var measurements: [Int] {
    data.split(separator: "\n")
      .compactMap { Int($0) }
  }

  func part1() throws -> Int {
    zip(measurements, measurements.dropFirst())
      .count {
        $0 < $1
      }
  }
}
