public enum Direction {
  case north
  case east
  case south
  case west
}

public struct Point : Hashable {
  public let x: Int
  public let y: Int

  public init(x: Int, y: Int) {
    self.x = x
    self.y = y
  }
}

public extension Point {
  func move(direction: Direction) -> Point {
    return switch direction {
    case .north:
        .init(x: x, y: y - 1)
    case .east:
        .init(x: x + 1, y: y)
    case .south:
        .init(x: x, y: y + 1)
    case .west:
        .init(x: x - 1, y: y)
    }
  }
}
