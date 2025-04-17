import Testing

@testable import AoC2015

struct Day19Tests {
  private let testData = """
    H => HO
    H => OH
    O => HH

    HOH
  """.replacing(/(  )+/.anchorsMatchLineEndings(), with: "")

  @Test func testPart1() {
    #expect(Day19(data: testData).part1() == 4)
  }
}
