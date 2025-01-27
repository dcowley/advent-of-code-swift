import Foundation
import Shared

struct Day03: AdventDay {
  var data: String

  var directions: [Direction] {
    data.compactMap {
      switch $0 {
      case "^": .north
      case ">": .east
      case "v": .south
      case "<": .west
      default: nil
      }
    }
  }

  func part1() -> Int {
    var current = Point(x: 0, y: 0)
    var visited = Set<Point>([current])

    directions.forEach {
      current = current.move(direction: $0)
      visited.insert(current)
    }

    return visited.count
  }

  func part2() -> Int {
    var santa = Point(x: 0, y: 0)
    var robot = santa
    var visited = Set<Point>([santa])

    directions.indexed().forEach { (index, direction) in
      if (index % 2 == 0) {
        santa = santa.move(direction: direction)
        visited.insert(santa)
      } else {
        robot = robot.move(direction: direction)
        visited.insert(robot)
      }
    }

    return visited.count
  }
}
