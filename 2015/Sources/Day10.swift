import Foundation

struct Day10: AdventDay {
  var data: String

  func part1() -> Int {
    var text = data.trimmingCharacters(in: .newlines)
    for _ in 0..<40 {
      text = text.matches(of: /(.)\1*/)
        .map { "\($0.output.0.count)\($0.output.1)" }
        .joined()
    }
    return text.count
  }
}
