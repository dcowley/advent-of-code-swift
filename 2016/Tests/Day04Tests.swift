import Testing

@testable import AoC2016

struct Day04Tests {
  let testData = """
  aaaaa-bbb-z-y-x-123[abxyz]
  a-b-c-d-e-f-g-h-987[abcde]
  not-a-real-room-404[oarel]
  totally-real-room-200[decoy]
  """

  @Test func testPart1() throws {
    #expect(try Day04(data: testData).part1() == 1514)
  }
}
