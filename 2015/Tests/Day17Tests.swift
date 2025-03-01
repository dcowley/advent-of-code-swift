import Testing

@testable import AoC2015

struct Day17Tests {
  private let testData = """
    20
    15
    10
    5
    5
  """.replacingOccurrences(of: " ", with: "")

  @Test func testPart1() {
    #expect(Day17(data: testData, target: 25).part1() == 4)
  }
}
