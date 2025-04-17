import Foundation
import Shared

private struct Instruction {
  let rotation: Rotation
  let steps: Int
}

struct Day01: AdventDay {
  var data: String

  func part1() throws -> Int {
    let instructions: [Instruction] = data.matches(of: /(?'turn'[R|L])(?'steps'\d+)/)
      .map {
        Instruction(
          rotation: $0.output.turn == "R" ? .clockwise : .anticlockwise,
          steps: Int($0.output.steps)!
        )
      }

    var direction = Direction.north
    var point = Point(x: 0, y: 0)
    instructions.forEach {
      direction = direction.turn(rotation: $0.rotation)
      point = point.move(direction: direction, steps: $0.steps)
    }

    return abs(point.x) + abs(point.y)
  }
}
