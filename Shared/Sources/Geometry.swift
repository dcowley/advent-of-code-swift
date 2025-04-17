public enum Direction {
  case north
  case east
  case south
  case west
}

public enum Rotation {
  case clockwise
  case anticlockwise
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
  func move(direction: Direction, steps: Int = 1) -> Point {
    return switch direction {
    case .north:
        .init(x: x, y: y - steps)
    case .east:
        .init(x: x + steps, y: y)
    case .south:
        .init(x: x, y: y + steps)
    case .west:
        .init(x: x - steps, y: y)
    }
  }
}

public extension Direction {
  func turn(rotation: Rotation) -> Direction {
    return switch self {
    case .north:
      rotation == .clockwise ? .east : .west
    case .east:
      rotation == .clockwise ? .south : .north
    case .south:
      rotation == .clockwise ? .west : .east
    case .west:
      rotation == .clockwise ? .north : .south
    }
  }
}
