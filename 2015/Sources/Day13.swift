import Foundation

struct Day13: AdventDay {
  var data: String

  private enum Effect : Substring {
    case gain
    case lose
  }

  private struct Pair: Hashable {
    let guest1: String
    let guest2: String

    init(guests: (String, String)) {
      guest1 = guests.0
      guest2 = guests.1
    }
  }

  private var relationships: [String: [String: Int]] {
    var relationships: [String: [String: Int]] = [:]
    data.split(separator: "\n").forEach { line in
      if let match = line.wholeMatch(of: /^(?'guest1'\w+)(?:[\w ])*(?'effect'gain|lose) (?'units'\d+)(?:[\w ])*(?: (?'guest2'\w+))\.$/) {
        let guest1 = String(match.output.guest1)
        let guest2 = String(match.output.guest2)
        let units = Int(match.output.units)!
        let effect = Effect(rawValue: match.output.effect)!

        let change = switch (effect) {
        case .gain: units
        case .lose: -units
        }

        relationships[guest1, default: [:]][guest2] = change
      }
    }
    return relationships
  }

  private func solve(_ relationships: [String: [String: Int]]) -> Int {
    let permutations = relationships.keys.permutations(ofCount: relationships.keys.count)

    var cache: Dictionary<Pair, Int> = [:]

    return permutations.map {
      ($0 + $0.prefix(1)).adjacentPairs().reduce(0) {
        let key = Pair(guests: $1)
        if let cached = cache[key] {
          return $0 + cached
        }

        let change = relationships[$1.0]![$1.1]! + relationships[$1.1]![$1.0]!
        cache[key] = change
        return $0 + change
      }
    }.max()!
  }

  func part1() -> Int {
    solve(relationships)
  }

  func part2() -> Int {
    var relationships = relationships
    let guests = relationships.keys
    relationships["Dean"] = Dictionary(uniqueKeysWithValues: guests.map { ($0, 0) })
    guests.forEach {
      relationships[$0]!["Dean"] = 0
    }

    return solve(relationships)
  }
}
