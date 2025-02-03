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
}
