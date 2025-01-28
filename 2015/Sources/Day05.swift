import CryptoKit
import Foundation
import Shared

struct Day05: AdventDay {
  var data: String

  func part1() throws -> Int {
    let rule1 = try Regex("(?:.*[aeiou].*){3}")
    let rule2 = try Regex("(.)\\1")
    let rule3 = try Regex("^(?!.*(ab|cd|pq|xy)).*")

    return data.split(separator: "\n").count {
      $0.contains(rule1) && $0.contains(rule2) && $0.contains(rule3)
    }
  }

  func part2() throws -> Int {
    let rule1 = try Regex("(.)(.)(?:.*)\\1\\2")
    let rule2 = try Regex("(.).\\1")

    return data.split(separator: "\n").count {
      $0.contains(rule1) && $0.contains(rule2)
    }
  }
}
