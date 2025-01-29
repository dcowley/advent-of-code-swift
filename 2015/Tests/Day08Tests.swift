import Testing

@testable import AoC2015

struct Day08Tests {
  @Test func testPart1() {
    #expect(Day08(data: "\"\"").part1() == 2)
    #expect(Day08(data: "\"abc\"").part1() == 2)
    #expect(Day08(data: "\"aaa\\\"aaa\"").part1() == 3)
    #expect(Day08(data: "\"\\x27\"").part1() == 5)
  }

  @Test func testPart2() {
    #expect(Day08(data: "\"\"").part2() == 4)
    #expect(Day08(data: "\"abc\"").part2() == 4)
    #expect(Day08(data: "\"aaa\\\"aaa\"").part2() == 6)
    #expect(Day08(data: "\"\\x27\"").part2() == 5)
  }
}
