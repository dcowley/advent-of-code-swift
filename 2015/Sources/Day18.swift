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

  func part1() -> Int {
    var state = grid
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

  private func neighbours(_ x: Int, _ y: Int) -> [(Int, Int)] {
    Array(stride(from: y - 1, through: y + 1, by: 1)).flatMap { r in
      Array(stride(from: x - 1, through: x + 1, by: 1)).map { c in
        (c, r)
      }.filter { (c, r) in (c, r) != (x, y) && xRange ~= c && yRange ~= r }
    }
  }
}
