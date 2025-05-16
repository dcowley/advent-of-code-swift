import Foundation
import Collections

private typealias KeyValuePair = (k: Character, v: Int)

struct Day04: AdventDay {
  let data: String

  func part1() -> Int {
    return data.matches(of: /([a-z-]+)-(\d+)\[([a-z]+)]/)
      .reduce(0) { sum, match in
        let (_, name, id, checksum) = match.output

        let counts = Dictionary(
          uniqueKeysWithValues: name.uniqued()
            .filter { $0.isLetter }
            .map { c in (c, name.count(where: { $0 == c })) }
        )

        let actualChecksum = counts.keys
          .sorted()
          .sorted(by: { counts[$0]! > counts[$1]! })
          .prefix(5)

        return if actualChecksum.elementsEqual(checksum) {
          sum + Int(id)!
        } else {
          sum
        }
      }
  }

  func part2() -> Int {
    let asciiStart = Int(Character("a").asciiValue!)

    return data.matches(of: /([a-z-]+)-(\d+)\[([a-z]+)]/)
      .map { match in
        let (_, name, id, _) = match.output

        let decrypted = name.split(separator: "-")
          .map { word in
            String(
              word.map { letter in
                Character(UnicodeScalar((Int(letter.asciiValue!) - asciiStart + Int(id)!) % 26 + asciiStart)!)
              }
            )
          }
          .joined(separator: " ")

        return (decrypted, Int(id)!)
      }
      .first(where: { $0.0 == "northpole object storage" })!.1
  }
}
