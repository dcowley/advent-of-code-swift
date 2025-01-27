import Testing

@testable import AoC2015

struct Day03Tests {
  @Test func testPart1() {
    #expect(Day03(data: ">").part1() == 2)
    #expect(Day03(data: "^>v<").part1() == 4)
    #expect(Day03(data: "^v^v^v^v^v").part1() == 2)
  }

  @Test func testPart2() {
    #expect(Day03(data: "^v").part2() == 3)
    #expect(Day03(data: "^>v<").part2() == 3)
    #expect(Day03(data: "^v^v^v^v^v").part2() == 11)
  }
}
