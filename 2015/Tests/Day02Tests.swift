import Testing

@testable import AoC2015

struct Day02Tests {
  @Test func testPart1() {
    #expect(Day02(data: "2x3x4").part1() == 58)
    #expect(Day02(data: "1x1x10").part1() == 43)
  }
}
