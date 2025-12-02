import Testing

@testable import AoC2025

struct Day01Tests {
  private let testData = """
  """

  @Test func testPart1() throws {
    #expect(try Day01(data: testData).part1() == Int.max)
  }

  @Test func testPart2() throws {
    #expect(try Day01(data: testData).part2() == Int.max)
  }
}
