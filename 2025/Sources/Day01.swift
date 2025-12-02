import Foundation
import Shared

private struct Rotation {
  enum Direction: Character {
    case left = "L"
    case right = "R"
  }

  let direction: Direction
  let clicks: Int
  let revolutions: Int
}

private struct Dial {
  let value: Int
  let zeroCounter: Int

  init(value: Int = 50, zeroCounter: Int = 0) {
    self.value = value
    self.zeroCounter = zeroCounter
  }

  func value(after rotation: Rotation) -> Int {
    switch rotation.direction {
    case .left:
      (value - rotation.clicks + 100) % 100
    case .right:
      (value + rotation.clicks) % 100
    }
  }
}

struct Day01: AdventDay {
  var data: String

  private var rotations: [Rotation] {
    data.split(separator: "\n")
      .compactMap {
        .init(
          direction: .init(rawValue: $0.first!)!,
          clicks: .init($0.dropFirst())! % 100,
          revolutions: .init($0.dropFirst())! / 100
        )
      }
  }

  func part1() throws -> Int {
    rotations.reduce(Dial()) { dial, rotation in
      let nextValue = dial.value(after: rotation)

      return Dial(
        value: nextValue,
        zeroCounter: dial.zeroCounter + (nextValue == 0 ? 1 : 0)
      )
    }.zeroCounter
  }

  func part2() throws -> Int {
    rotations.reduce(Dial()) { dial, rotation in
      let nextValue = dial.value(after: rotation)

      return Dial(
        value: nextValue,
        zeroCounter: dial.zeroCounter + rotation.revolutions
          + (nextValue == 0 ? 1 : 0)
          + (rotation.direction == .left && 1 ..< rotation.clicks ~= dial.value ? 1 : 0)
          + (rotation.direction == .right && dial.value + rotation.clicks > 100 ? 1 : 0)
      )
    }.zeroCounter
  }
}
