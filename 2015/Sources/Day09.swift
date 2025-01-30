import Collections
import Foundation
import Shared

struct Day09: AdventDay {
  var data: String

  private var distances: [String: [String: Int]] {
    var distances = [String: [String : Int]]()
    data.enumerateLines { line, _ in
      let match = line
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .wholeMatch(of: /^(?'city0'\w+) to (?'city1'\w+) = (?'dist'\d+)$/)

      let (_, city0, city1, dist) = match!.output
      distances[String(city0), default: [:]][String(city1)] = Int(dist)!
      distances[String(city1), default: [:]][String(city0)] = Int(dist)!
    }
    return distances
  }

  func part1() -> Int {
    let finalState = 1 << distances.keys.count - 1
    let cities = distances.keys.sorted()

    func tsp(initial: String) -> Int {
      let state = 1 << cities.firstIndex(of: initial)!

      var queue = Heap([Node(city: initial, dist: 0, state: state)])
      var visited = Set<Int>()

      while !queue.isEmpty {
        let next = queue.popMin()!
        if next.state == finalState {
          return next.dist
        }

        distances[next.city]!.forEach { (city, dist) in
          let nextState = next.state | (1 << cities.firstIndex(of: city)!)
          if !visited.contains(nextState) {
            visited.insert(nextState)
            queue.insert(.init(city: city, dist: next.dist + dist, state: nextState))
          }
        }
      }

      return Int.max
    }

    return distances.keys.map(tsp(initial:)).min()!
  }

  func part2() -> Int {
    let finalState = (1 << distances.keys.count) - 1
    let cities = distances.keys.sorted()

    func dfs(city: String, state: Int, dist: Int = 0, visited: Set<Int>) -> Int {
      var visited = visited
      visited.insert(state)

      if state == finalState {
        return dist
      }

      var maxDist = Int.min
      distances[city]!.forEach { (nextCity, nextDist) in
        let nextState = state | (1 << cities.firstIndex(of: nextCity)!)
        if !visited.contains(nextState) {
          maxDist = max(maxDist, dfs(city: nextCity, state: nextState, dist: dist + nextDist, visited: visited))
        }
      }

      return maxDist
    }

    return distances.keys
      .map { dfs(city: $0, state: 1 << cities.firstIndex(of: $0)!, visited: Set<Int>()) }
      .max()!
  }

  struct Node: Comparable {
    let city: String
    let dist: Int
    let state: Int

    static func < (lhs: Node, rhs: Node) -> Bool {
      lhs.dist < rhs.dist
    }
  }
}
