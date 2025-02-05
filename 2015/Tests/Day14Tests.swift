import Testing

@testable import AoC2015

struct Day14Tests {
  private let testData = """
  Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
  Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
  """.replacing(/^ +/.anchorsMatchLineEndings(), with: { _ in "" })

  @Test func testPart1() {
    #expect(Day14(data: testData, totalTime: 1).part1() == 16)
    #expect(Day14(data: testData, totalTime: 10).part1() == 160)
    #expect(Day14(data: testData, totalTime: 12).part1() == 176)
    #expect(Day14(data: testData, totalTime: 1000).part1() == 1120)
  }

  @Test func testPart2() {
    #expect(Day14(data: testData, totalTime: 1).part2() == 1)
    #expect(Day14(data: testData, totalTime: 140).part2() == 139)
    #expect(Day14(data: testData, totalTime: 1000).part2() == 689)
  }
}
