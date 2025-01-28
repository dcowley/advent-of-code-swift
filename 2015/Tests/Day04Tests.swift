import Testing

@testable import AoC2015

struct Day04Tests {

  @Test(.disabled()) func testPart1() {
    #expect(Day04(data: "abcdef").part1() == 609043)
    #expect(Day04(data: "pqrstuv").part1() == 1048970)
  }
}
