import Testing

@testable import AoC2016

struct Day02Tests {
  let testData = """
  ULL
  RRDDD
  LURDL
  UUUUD
  """

  @Test func testPart1() throws {
    #expect(try Day02(data: testData).part1() == "1985")
  }

  @Test func testPart2() throws {
    #expect(try Day02(data: testData).part2() == "5DB3")
  }
}
