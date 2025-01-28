import CryptoKit
import Foundation
import Shared

struct Day05: AdventDay {
  var data: String

  func part1() throws -> Int {
    let rule1 = try Regex("(?:.*[aeiou].*){3}")
    let rule2 = try Regex("(.)\\1")
    let rule3 = try Regex("^(?!.*(ab|cd|pq|xy)).*$")

    return data.split(separator: "\n").count {
      !(
        $0.matches(of: rule1).isEmpty ||
        $0.matches(of: rule2).isEmpty ||
        $0.matches(of: rule3).isEmpty
      )
    }
  }

  func part2() throws -> Int {
    let rule1 = try Regex("(.)(.)(?:.*)\\1\\2")
    let rule2 = try Regex("(.).\\1")

    return data.split(separator: "\n").count {
      !(
        $0.matches(of: rule1).isEmpty ||
        $0.matches(of: rule2).isEmpty
      )
    }
  }
}
