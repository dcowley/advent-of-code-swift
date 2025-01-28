import Testing

@testable import AoC2015

struct Day05Tests {
  @Test func testPart1() throws {
    #expect(try Day05(data: "ugknbfddgicrmopn").part1() == 1)
    #expect(try Day05(data: "aaa").part1() == 1)
    #expect(try Day05(data: "jchzalrnumimnmhp").part1() == 0)
    #expect(try Day05(data: "haegwjzuvuyypxyu").part1() == 0)
    #expect(try Day05(data: "dvszwmarrgswjxmb").part1() == 0)
  }
}
