import Foundation

struct Day17: AdventDay {
  let data: String
  let target: Int

  private var containers: [Int] {
    data.split(separator: /\n/).compactMap { Int($0) }
  }

  init(data: String) {
    self.init(data: data, target: 150)
  }

  init(data: String, target: Int) {
    self.data = data
    self.target = target
  }

  func part1() -> Int {
    containers
      .combinations(ofCount: 1...containers.count)
      .filter { $0.reduce(0, +) == target }
      .count
  }

  func part2() -> Int {
    let combinations = containers
      .combinations(ofCount: 1...containers.count)
      .filter { $0.reduce(0, +) == target }

    let minCount = combinations.min(by: { $0.count < $1.count })?.count

    return combinations
      .filter { $0.count == minCount }
      .count
  }
}
