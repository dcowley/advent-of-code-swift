import Testing

@testable import AoC2015

struct Day06Tests {
  @Test func testPart1() throws {
    #expect(try Day06(data: "turn on 0,0 through 999,999").part1() == 1_000_000)
    #expect(try Day06(data: "toggle 0,0 through 999,0").part1() == 1_000)
    #expect(try Day06(data: "turn on 0,0 through 999,999\nturn off 499,499 through 500,500").part1() == 999_996)
  }
}
