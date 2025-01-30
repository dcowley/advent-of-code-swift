import Testing

@testable import AoC2015

struct Day09Tests {
  private let testData = """
    London to Dublin = 464
    London to Belfast = 518
    Dublin to Belfast = 141
  """.trimmingCharacters(in: .whitespacesAndNewlines)

  @Test func testPart1() {
    #expect(Day09(data: testData).part1() == 605)
  }

  @Test func testPart2() {
    #expect(Day09(data: testData).part2() == 982)
  }
}
