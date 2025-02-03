import Foundation

struct Day12: AdventDay {
  var data: String

  func part1() -> Int {
    data.matches(of: /(?'num'-{0,1}\d+)/)
      .map { Int($0.output.num)! }
      .reduce(0, +)
  }
}
