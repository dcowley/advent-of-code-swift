import Testing

@testable import AoC2021

struct Day01Tests {
  private let testData = """
  199
  200
  208
  210
  200
  207
  240
  269
  260
  263
  """

  private let day: Day01

  init() {
    self.day = Day01(data: testData)
  }

  @Test func part1() throws {
    #expect(try day.part1() == 7)
  }

  @Test func part2() async throws {
    #expect(try day.part2() == 5)
  }
}
