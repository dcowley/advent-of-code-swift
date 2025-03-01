import Foundation

struct Day16: AdventDay {
  let data: String
  private let attrs = [
    "children": 3,
    "cats": 7,
    "samoyeds": 2,
    "pomeranians": 3,
    "akitas": 0,
    "vizslas": 0,
    "goldfish": 5,
    "trees": 3,
    "cars": 2,
    "perfumes": 1
  ]

  private var aunts: [Int: [String: Int]] {
    let regex = /^Sue (?'num'\d+): (?'key1'\w+): (?'val1'\d+), (?'key2'\w+): (?'val2'\d+), (?'key3'\w+): (?'val3'\d+)$/
    return Dictionary(uniqueKeysWithValues: data.matches(of: regex.anchorsMatchLineEndings())
      .map { match in
        let attrs = [
          String(match.output.key1): Int(match.output.val1)!,
          String(match.output.key2): Int(match.output.val2)!,
          String(match.output.key3): Int(match.output.val3)!,
        ]
        return (Int(match.output.num)!, attrs)
      }
    )
  }

  func part1() -> Int {
    var filtered = aunts
    attrs.forEach { key, value in
      filtered = filtered.filter { !$1.keys.contains(key) || $1[key] == value }
    }
    return filtered.keys.first ?? -1
  }
}
