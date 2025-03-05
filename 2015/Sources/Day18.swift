import Foundation

struct Day18: AdventDay {
  let data: String
  let steps: Int
  let width: Int
  let height: Int

  private var xRange: Range<Int> { 0..<width }
  private var yRange: Range<Int> { 0..<height }
  private var coordinates: [(Int, Int)] {
    yRange.flatMap { y in
      xRange.map { x in (x, y)
      }
    }
  }
  private var corners: [(Int, Int)] {
    [
      (0, 0),
      (0, height - 1),
      (width - 1, 0),
      (width - 1, height - 1),
    ]
  }

  private var grid: [[Bool]] {
    data.split(separator: /\n/).map {
      $0.map {
        $0 == "#"
      }
    }
  }

  init(data: String) {
    self.init(data: data, steps: 100, width: 100, height: 100)
  }

  init(data: String, steps: Int, width: Int, height: Int) {
    self.data = data
    self.steps = steps
    self.width = width
    self.height = height
  }

  private func solve(_ initialState: [[Bool]], coordinates: [(Int, Int)]) -> Int {
      var state = initialState
      var nextState = state

      for _ in 0..<steps {
        for (x, y) in coordinates {
          let isOn = state[y][x]
          let neighbours = neighbours(x, y)

          switch neighbours.count(where: { x, y in state[y][x] }) {
          case 2 where isOn:
            nextState[y][x] = true
          case 3:
            nextState[y][x] = true
          default:
            nextState[y][x] = false
          }
        }

        state = nextState
      }

      return state.reduce(0) { count, row in
        count + row.count { $0 }
      }
  }

  func part1() -> Int {
    solve(grid, coordinates: coordinates)
  }

  func part2() -> Int {
    var state = grid
    for (x, y) in corners {
      state[y][x] = true
    }
    return solve(state, coordinates: coordinates.filter({ x, y in !isCorner(x, y) }))
  }

  private func isCorner(_ x: Int, _ y: Int) -> Bool {
    corners.contains(where: { $0 == (x, y) })
  }

  private func neighbours(_ x: Int, _ y: Int) -> [(Int, Int)] {
    Array(stride(from: y - 1, through: y + 1, by: 1)).flatMap { r in
      Array(stride(from: x - 1, through: x + 1, by: 1)).map { c in
        (c, r)
      }.filter { (c, r) in (c, r) != (x, y) && xRange ~= c && yRange ~= r }
    }
  }
}
