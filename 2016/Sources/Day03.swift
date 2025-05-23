import Algorithms
import Foundation
import Shared

struct Day03: AdventDay {
  let data: String

  func part1() throws -> Int {
    let sides =  data.matches(of: /(\d+)/)
      .compactMap { Int($0.output.0) }
      .chunks(ofCount: 3)
      .map { $0.sorted() }

    return sides.count { $0[0] + $0[1] > $0[2] }
  }

  func part2() throws -> Int {
    let numbers = data.matches(of: /(\d+)/).compactMap { Int($0.output.0) }

    var count = 0
    for i in 0..<3 {
      let indices = sequence(first: i) {
        guard numbers.indices.contains($0 + 3) else {
          return nil
        }
        return $0 + 3
      }

      count += indices.map { numbers[$0] }
        .chunks(ofCount: 3)
        .map { $0.sorted() }
        .count { $0[0] + $0[1] > $0[2] }
    }

    return count
  }
}
