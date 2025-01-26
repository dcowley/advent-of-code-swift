import Testing

@testable import AoC2015

struct Day01Tests {
  @Test func testPart1() {
    let testData = [
      "(())": 0,
      "()()": 0,
      "(((": 3,
      "(()(()(": 3,
      "))(((((": 3,
      "())": -1,
      "))(": -1,
      ")))": -3,
      ")())())": -3,
    ]

    testData.forEach { input, expected in
      let challenge = Day01(data: input)
      #expect(challenge.part1() == expected)
    }
  }

  @Test func testPart2() {
    #expect(Day01(data: ")").part2() == 1)
    #expect(Day01(data: "()())").part2() == 5)
  }
}
