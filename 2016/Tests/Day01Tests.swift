import Testing

@testable import AoC2016

struct Day01Tests {
  @Test func testPart1() throws {
    #expect(try Day01(data: "R2, L3").part1() == 5)
    #expect(try Day01(data: "R2, R2, R2").part1() == 2)
    #expect(try Day01(data: "R5, L5, R5, R3").part1() == 12)
  }

  @Test func testPart2() throws {
    #expect(try Day01(data: "R8, R4, R4, R8").part2() == 4)
  }
}
