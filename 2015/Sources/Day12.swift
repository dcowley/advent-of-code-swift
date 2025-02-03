import Foundation

struct Day12: AdventDay {
  var data: String

  func part1() -> Int {
    data.matches(of: /(?'num'-{0,1}\d+)/)
      .map { Int($0.output.num)! }
      .reduce(0, +)
  }

  func part2() throws -> Int {
    func solve(_ json: Any) -> Int {
      if let num = json as? Int {
        return num
      }

      if let arr = json as? [Any] {
        return arr.reduce(0) {
          $0 + solve($1)
        }
      }

      if let obj = json as? [String: Any] {
        if obj.values.contains(where: { $0 as? String == "red" }) {
          return 0
        }

        return obj.values.reduce(0) {
          $0 + solve($1)
        }
      }

      return 0
    }

    return solve(try JSONSerialization.jsonObject(with: data.data(using: .utf8)!))
  }
}
