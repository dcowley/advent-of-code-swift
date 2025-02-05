import Foundation

struct Day14: AdventDay {
  var data: String

  private let totalTime: Int

  init(data: String) {
    self.init(data: data, totalTime: 2503)
  }

  init(data: String, totalTime: Int) {
    self.data = data
    self.totalTime = totalTime
  }

  private var reindeers: [String: Reindeer] {
    Dictionary(uniqueKeysWithValues: data
      .matches(
        of: /^(?'name'\w+).*(?: (?'velocity'\d+) km\/s).*(?: (?'moveSeconds'\d+) seconds).*(?: (?'restSeconds'\d+) seconds)\.$/
          .anchorsMatchLineEndings()
      )
      .map { (
          String($0.output.name),
          Reindeer(
            velocity: Int($0.output.velocity)!,
            moveSeconds: Int($0.output.moveSeconds)!,
            restSeconds: Int($0.output.restSeconds)!
          )
        )
      }
    )
  }

  func part1() -> Int {
    reindeers.map { name, reindeer in
      let intervals =  totalTime / (reindeer.moveSeconds + reindeer.restSeconds)
      let remaining = min(reindeer.moveSeconds, totalTime - intervals * (reindeer.moveSeconds + reindeer.restSeconds))

      return reindeer.displacement(over: reindeer.moveSeconds * intervals + remaining)
    }.max()!
  }

  private struct Reindeer {
    let velocity: Int
    let moveSeconds: Int
    let restSeconds: Int

    func displacement(over seconds: Int) -> Int {
      velocity * seconds
    }
  }
}
