import CryptoKit
import Foundation
import Shared

struct Day05: AdventDay {
  var data: String

  func part1() throws -> Int {
    let vowels = try Regex("^(?:.*[aeiou].*){3}$")
    let repeats = try Regex("(.)\\1")
    let allowed = try Regex("^(?!.*(ab|cd|pq|xy)).*$")

    return data.split(separator: "\n").count {
      !$0.matches(of: vowels).isEmpty && !$0.matches(of: repeats).isEmpty && !$0.matches(of: allowed).isEmpty
    }
  }
}
