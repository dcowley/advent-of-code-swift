import Testing

@testable import AoC2016

struct Day03Tests {
  let testData = """
  ULL
  RRDDD
  LURDL
  UUUUD
  """

  @Test func testPart2() throws {
    let testData = """
      101 301 501
      102 302 502
      103 303 503
      201 401 601
      202 402 602
      203 403 603
    """

    #expect(try Day03(data: testData).part2() == 6)
  }
}
