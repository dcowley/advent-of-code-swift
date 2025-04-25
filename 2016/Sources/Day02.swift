import Shared

struct Day02: AdventDay {
  let data: String

  private let keypad: [[String]] = [
    ["1", "2", "3"],
    ["4", "5", "6"],
    ["7", "8", "9"],
  ]

  private var inputs: [[Direction]] {
    data.split(separator: /\n/).map { line in
      line.compactMap {
        switch $0 {
        case "U": .north
        case "D": .south
        case "L": .west
        case "R": .east
        default: nil
        }
      }
    }
  }

  func part1() -> String {
    var (x, y) = (1, 1)
    var code = ""

    inputs.forEach {
      $0.forEach {
        (x, y) = switch $0 {
        case .north: (x, max(y - 1, 0))
        case .south: (x, min(y + 1, 2))
        case .west: (max(x - 1, 0), y)
        case .east: (min(x + 1, 2), y)
        }
      }

      code += keypad[y][x]
    }

    return code
  }
}
