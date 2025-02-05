import Testing

@testable import AoC2015

struct Day15Tests {
  private let testData = """
  Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
  Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
  """.replacing(/^ +/.anchorsMatchLineEndings(), with: { _ in "" })

  @Test func testPart1() {
    #expect(Day15(data: testData).part1() == 62842880)
  }
}
