import Testing

@testable import AoC2015

struct Day10Tests {
  @Test func testNext() {
    #expect(Day10().next("1") == "11")
    #expect(Day10().next("11") == "21")
    #expect(Day10().next("1211") == "111221")
    #expect(Day10().next("111221") == "312211")
  }
}
