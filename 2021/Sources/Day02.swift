import Foundation
import Shared

private enum Direction: Substring {
  case forward
  case up
  case down
}

struct Day02: AdventDay {
  var data: String

  private var commands: [(direction: Direction, units: Int)] {
    data.matches(of: /(?'direction'\w+)\s(?'units'\d+)/)
      .compactMap { match in
        guard let direction = Direction(rawValue: match.output.direction),
              let units = Int(match.output.units)
        else {
          return nil
        }

        return (direction, units)
      }
  }

  func part1() throws -> Int {
    var position = 0
    var depth = 0

    commands.forEach { (direction, units) in
      switch direction {
      case .forward:
        position += units
      case .down:
        depth += units
      case .up:
        depth -= units
      }
    }

    return position * depth
  }
}
