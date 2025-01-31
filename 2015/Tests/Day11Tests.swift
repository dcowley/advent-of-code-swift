import Testing

@testable import AoC2015

struct Day11Tests {
  private let day = Day11()

  @Test func testHasStraight() {
    #expect(day.hasStraight(text: "hijklmmn".map(Character.init)) == true)
    #expect(day.hasStraight(text: "abbceffg".map(Character.init)) == false)
  }

  @Test func testHasPairs() {
    #expect(day.hasPairs(text: "abbceffg".map(Character.init)) == true)
    #expect(day.hasPairs(text: "abbcegjk".map(Character.init)) == false)
  }

  @Test func testPart1() {
    #expect(Day11(data: "abcdefgh").part1() == "abcdffaa")
    #expect(Day11(data: "ghijklmn").part1() == "ghjaabcc")
  }
}
