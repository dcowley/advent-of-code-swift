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
    aunts.first { _, attrs in
      self.attrs.allSatisfy { key, value in
        attrs[key, default: value] == value
      }
    }?.key ?? -1
  }

  func part2() -> Int {
    aunts.first { _, attrs in
      self.attrs.allSatisfy { key, value in
        return switch key {
        case "cats", "trees":
          attrs[key, default: Int.max] > value
        case "pomeranians", "goldfish":
          attrs[key, default: Int.min] < value
        default:
          attrs[key, default: value] == value
        }
      }
    }?.key ?? -1
  }
}
