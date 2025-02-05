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

  private func solve(seconds: Int) -> [String: Int] {
    Dictionary(uniqueKeysWithValues: reindeers.map { name, reindeer in
      let intervals =  seconds / (reindeer.moveSeconds + reindeer.restSeconds)
      let remaining = min(reindeer.moveSeconds, seconds - intervals * (reindeer.moveSeconds + reindeer.restSeconds))

      return (name, reindeer.displacement(over: reindeer.moveSeconds * intervals + remaining))
    })
  }

  func part1() -> Int {
    solve(seconds: totalTime).values.max()!
  }

  func part2() -> Int {
    var points = [String: Int]()

    for i in 0..<totalTime {
      let displacements = solve(seconds: i + 1)
      let max = displacements.values.max()!

      displacements.filter { (_, displacement) in displacement == max }.keys.forEach { name in
        points[name, default: 0] += 1
      }
    }

    return points.values.max()!
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
