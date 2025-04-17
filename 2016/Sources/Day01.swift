import Foundation
import Shared

private struct Instruction {
  let rotation: Rotation
  let steps: Int
}

struct Day01: AdventDay {
  var data: String

  private var instructions: [Instruction] {
    data.matches(of: /(?'turn'[R|L])(?'steps'\d+)/)
      .map {
        Instruction(
          rotation: $0.output.turn == "R" ? .clockwise : .anticlockwise,
          steps: Int($0.output.steps)!
        )
      }
  }

  func part1() throws -> Int {
    var direction = Direction.north
    var point = Point(x: 0, y: 0)

    instructions.forEach {
      direction = direction.turn(rotation: $0.rotation)
      point = point.move(direction: direction, steps: $0.steps)
    }

    return abs(point.x) + abs(point.y)
  }

  func part2() throws -> Int {
    var direction = Direction.north
    var point = Point(x: 0, y: 0)

    var visitedPoints: Set<Point> = []
    for instruction in instructions {
      direction = direction.turn(rotation: instruction.rotation)

      for _ in 0..<instruction.steps {
        point = point.move(direction: direction)

        if visitedPoints.contains(point) {
          return abs(point.x) + abs(point.y)
        } else {
          visitedPoints.insert(point)
        }
      }
    }

    return abs(point.x) + abs(point.y)
  }
}
