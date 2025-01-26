import Foundation

struct Day01: AdventDay {
  var data: String

  func part1() -> Int {
    return data.reduce(0, { $0 + ($1 == "(" ? 1 : -1 )})
  }

  func part2() -> Int {
    var chars = data

    var floor = 0
    var index = 0

    while (floor != -1) {
      let char = chars.removeFirst()
      floor += char == "(" ? 1 : -1
      index += 1
    }
    return index
  }
}
