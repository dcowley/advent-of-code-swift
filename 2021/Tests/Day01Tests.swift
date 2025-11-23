import Testing

@testable import AoC2021

struct Day01Tests {
  private let day = Day01()

  @Test
  func part1() throws {
    #expect(try day.part1() == -1)
  }
}
