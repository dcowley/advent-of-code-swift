import Foundation

struct Day10: AdventDay {
  var data: String

  func solve(iterations: Int) -> Int {
      var text = data.trimmingCharacters(in: .newlines)
      for _ in 0..<iterations {
        text = next(text)
      }
      return text.count
  }

  func next(_ input: String) -> String {
    input.matches(of: /(.)\1*/)
      .map { "\($0.output.0.count)\($0.output.1)" }
      .joined()
  }

  func part1() -> Int {
    solve(iterations: 40)
  }

  func part2() -> Int {
    solve(iterations: 50)
  }
}
