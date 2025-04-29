import Foundation
import Shared

struct Day03: AdventDay {
  let data: String

  private var regex: Regex<(Substring, Substring, Substring, Substring)> {
    /\s+(\d+)\s+(\d+)\s+(\d+)/.anchorsMatchLineEndings()
  }

  func part1() throws -> Int {
    data.matches(of: regex).count { match in
      let (_, x, y, z) = match.output
      let sides = [Int(x)!, Int(y)!, Int(z)!].sorted()

      return sides[0] + sides[1] > sides[2]
    }
  }
}
