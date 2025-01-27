import Foundation

struct Day02: AdventDay {
  var data: String

  var dimensions: [[Int]] {
    get {
      data.split(separator: "\n").map {
        $0.split(separator: "x")
          .compactMap { Int($0) }
          .sorted()
      }
    }
  }

  func part1() -> Int {
    dimensions.reduce(0) { (sum, sides) in
      sum + 2 * (sides[0] * sides[1] + sides[1] * sides[2] + sides[2] * sides[0]) + (sides[0] * sides[1])
    }
  }
}
