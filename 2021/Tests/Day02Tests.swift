import Testing

@testable import AoC2021

struct Day02Tests {
  private let testData = """
    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2
    """

  private let day: Day02

  init() {
    day = Day02(data: testData)
  }

  @Test func part1() throws {
    #expect(try day.part1() == 150)
  }
}
