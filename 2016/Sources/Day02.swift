import Foundation
import Shared

struct Day02: AdventDay {
  let data: String

  private var directions: [[Direction]] {
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

  private func solve(keypad: [[Character]], initial: (Int, Int)) -> String {
    let rows = keypad.count
    let cols = keypad.first!.count

    var position = initial
    var code = ""

    directions.forEach {
      $0.forEach {
        var (col, row) = position
        (col, row) = switch $0 {
        case .north: (col, max(row - 1, 0))
        case .south: (col, min(row + 1, rows - 1))
        case .west: (max(col - 1, 0), row)
        case .east: (min(col + 1, cols - 1), row)
        }

        let key = keypad[row][col]
        if key.isLetter || key.isNumber {
          position = (col, row)
        }
      }

      let (col, row) = position
      code += String(keypad[row][col])
    }

    return code
  }

  func part1() -> String {
    let keypad = """
    123
    456
    789
    """.split(separator: /\n/).map { Array($0) }

    return solve(keypad: keypad, initial: (1, 1))
  }

  func part2() -> String {
    let keypad = """
      1  
     234 
    56789
     ABC 
      D  
    """.split(separator: /\n/).map { Array($0) }

    return solve(keypad: keypad, initial: (0, 2))
  }
}
