import Testing

@testable import AoC2016

struct Day02Tests {
  @Test func testPart1() throws {
    let testData = """
      ULL
      RRDDD
      LURDL
      UUUUD
    """.replacingOccurrences(of: " ", with: "")

    #expect(try Day02(data: testData).part1() == "1985")
  }
}
