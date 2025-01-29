import CryptoKit
import Foundation
import Shared

struct Day08: AdventDay {
  var data: String

  private var lines: [String] {
    data.isEmpty ? [data] : data.split(separator: /\n/).map(String.init)
  }

  func part1() -> Int {
    lines.reduce(2 * lines.count) { result, line in
      result + line.count - line
        .replacing(/\\"/, with: ".")
        .replacing(/\\\\/, with: ".")
        .replacing(/\\x\w{2}/, with: ".")
        .count
    }
  }
}
