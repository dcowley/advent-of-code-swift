import Foundation

struct Day11: AdventDay {
  var data: String

  private var alphabet: [Character] {
    let a = "a".unicodeScalars.first!.value
    let z = "z".unicodeScalars.first!.value
    return Array((a...z).reduce("") { $0 + "\(Character(UnicodeScalar($1)!))" })
  }

  private let disallowed = ["i", "o", "u"].map(Character.init)

  func hasStraight(text: [Character]) -> Bool {
    alphabet.windows(ofCount: 3).contains { text.contains($0) }
  }

  func hasPairs(text: [Character]) -> Bool {
    alphabet.count(where: { text.contains([$0, $0]) }) >= 2
  }

  private func solve(initial: String) -> String {
    var text: [Character] = Array(initial.trimmingCharacters(in: .newlines))

    repeat {
      disallowed.forEach {
        if let index = text.firstIndex(of: $0) {
          text[index] = alphabet[alphabet.firstIndex(of: $0)! + 1]
          for i in (index + 1)..<text.count {
            text[i] = alphabet[0]
          }
        }
      }

      for (i, value) in text.indexed().reversed() {
        let index = alphabet.firstIndex(of: value)!
        if index == alphabet.indices.last {
          text[i] = alphabet[0]
        } else {
          text[i] = alphabet[index + 1]
          break
        }
      }
    } while !(hasStraight(text: text) && hasPairs(text: text))

    return String(text)
  }

  func part1() -> String {
    solve(initial: data)
  }


  func part2() -> String {
    solve(initial: part1())
  }
}
