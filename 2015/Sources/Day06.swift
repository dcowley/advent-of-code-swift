import CryptoKit
import Foundation
import Shared

enum Action : String {
  case turnOn = "turn on"
  case turnOff = "turn off"
  case toggle = "toggle"
}

struct Day06: AdventDay {
  var data: String

  private typealias Match = (Substring, action: Substring, start: Substring, end: Substring)
  private var instructions: [(action: Action, start: Point, end: Point)] {
    let regex: Regex<Match> = /^(?'action'turn on|toggle|turn off) (?'start'\d+,\d+) through (?'end'\d+,\d+)$/

    return data.matches(of: regex.anchorsMatchLineEndings()).map {
      let start = $0.output.start
        .split(separator: ",", maxSplits: 1)
        .compactMap { Int($0) }
      let end = $0.output.end
        .split(separator: ",", maxSplits: 1)
        .compactMap { Int($0) }

      return (
        .init(rawValue: String($0.output.action))!,
        .init(x: start.first!, y: start.last!),
        .init(x: end.first!, y: end.last!)
      )
    }
  }

  func part1() throws -> Int {
    var state = [Bool](repeating: false, count: 1000 * 1000)
    instructions.forEach {
        for x in $0.start.x ... $0.end.x {
          for y in $0.start.y ... $0.end.y {
            let index = x + y * 1000
            state[index] = switch $0.action {
            case .turnOn: true
            case .turnOff: false
            case .toggle: !state[index]
            }
          }
        }
    }

    return state.count(where: { $0 })
  }
}
