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

  private lazy var day = Day01(data: testData)

  @Test
  mutating func part1() throws {
    #expect(try day.part1() == 7)
  }
}
