import Testing

@testable import AoC2015

struct Day07Tests {
  let testData = String("""
    123 -> x
    456 -> y
    x AND y -> d
    x OR y -> e
    x LSHIFT 2 -> f
    y RSHIFT 2 -> g
    NOT x -> h
    NOT y -> i
  """.trimmingPrefix(/\ */))

  @Test func testPart1() {
    #expect(Day07(data: testData, wire: "d").part1() == 72)
    #expect(Day07(data: testData, wire: "e").part1() == 507)
    #expect(Day07(data: testData, wire: "f").part1() == 492)
    #expect(Day07(data: testData, wire: "g").part1() == 114)
    #expect(Day07(data: testData, wire: "h").part1() == 65412)
    #expect(Day07(data: testData, wire: "i").part1() == 65079)
    #expect(Day07(data: testData, wire: "x").part1() == 123)
    #expect(Day07(data: testData, wire: "y").part1() == 456)
  }
}
