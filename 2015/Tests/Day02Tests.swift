import Testing

@testable import AoC2015

struct Day02Tests {
  @Test func testPart1() {
    #expect(Day02(data: "2x3x4").part1() == 58)
    #expect(Day02(data: "1x1x10").part1() == 43)
  }

  @Test func testPart2() {
    #expect(Day02(data: "2x3x4").part2() == 34)
    #expect(Day02(data: "1x1x10").part2() == 14)
  }
}
