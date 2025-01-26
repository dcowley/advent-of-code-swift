import Testing

@testable import AoC2015

struct Day01Tests {
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
  
  @Test func testPart1() {
    testData.forEach { input, expected in
      let challenge = Day01(data: input)
      #expect(challenge.part1() == expected)
    }
  }
  
  @Test func testPart2() {
    #expect(Day01(data: ")").part2() == 1)
    debugPrint(Day01(data: "()())").part2())
    #expect(Day01(data: "()())").part2() == 5)
  }
}
