import Foundation

struct Day01: AdventDay {
  var data: String
  
  func part1() -> Int {
    return data.count(where: { $0 == "(" }) - data.count(where: { $0 == ")" })
  }
  
  func part2() -> Int {
    var chars = data

    var index = 0
    var floor = 0
    while (floor != -1) {
      let char = chars.removeFirst()
      floor = char == "(" ? floor + 1 : floor - 1
      index += 1
    }
    return index
  }
}
