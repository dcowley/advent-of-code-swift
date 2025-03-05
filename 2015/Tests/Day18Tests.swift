import Testing

@testable import AoC2015

struct Day18Tests {
  private let testData = """
    .#.#.#
    ...##.
    #....#
    ..#...
    #.#..#
    ####..
  """.replacingOccurrences(of: " ", with: "")

  @Test func testPart1() {
    #expect(Day18(data: testData, steps: 1, width: 6, height: 6).part1() == 11)
    #expect(Day18(data: testData, steps: 2, width: 6, height: 6).part1() == 8)
    #expect(Day18(data: testData, steps: 3, width: 6, height: 6).part1() == 4)
    #expect(Day18(data: testData, steps: 4, width: 6, height: 6).part1() == 4)
  }
}
