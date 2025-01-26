import Foundation

struct Day01: AdventDay {
  var data: String
  
  func part1() -> Int {
    return data.count(where: { $0 == "(" }) - data.count(where: { $0 == ")" })
  }
}
