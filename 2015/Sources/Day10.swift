import Foundation

struct Day10: AdventDay {
  var data: String

  func next(_ input: String) -> String {
    input.matches(of: /(.)\1*/)
      .map { "\($0.output.0.count)\($0.output.1)" }
      .joined()
  }

  func part1() -> Int {
    var text = data.trimmingCharacters(in: .newlines)
    for _ in 0..<40 {
      text = next(text)
    }
    return text.count
  }

  func part2() -> Int {
    var text = data.trimmingCharacters(in: .newlines)
    for _ in 0..<50 {
      text = next(text)
    }
    return text.count
  }
}
