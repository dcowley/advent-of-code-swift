import Testing

@testable import AoC2015

struct Day12Tests {
  @Test func testPart1() {
    #expect(Day12(data: "[1,2,3]").part1() == 6)
    #expect(Day12(data: "{\"a\":2,\"b\":4}").part1() == 6)
    #expect(Day12(data: "[[[3]]]").part1() == 3)
    #expect(Day12(data: "{\"a\":{\"b\":4},\"c\":-1}").part1() == 3)
    #expect(Day12(data: "{\"a\":[-1,1]}").part1() == 0)
    #expect(Day12(data: "[-1,{\"a\":1}]").part1() == 0)
  }

  @Test func testPart2() throws {
    #expect(try Day12(data: "[1,2,3]").part2() == 6)
    #expect(try Day12(data: "[1,{\"c\":\"red\",\"b\":2},3]").part2() == 4)
    #expect(try Day12(data: "{\"d\":\"red\",\"e\":[1,2,3,4],\"f\":5}").part2() == 0)
    #expect(try Day12(data: "[1,\"red\",5]").part2() == 6)
  }
}
