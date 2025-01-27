import CryptoKit
import Foundation
import Shared

struct Day04: AdventDay {
  var data: String

  var secretKey: String {
    data.trimmingCharacters(in: .newlines)
  }

  func part1() -> Int {
    var i = 0
    while true {
      i += 1

      let digest = Insecure.MD5
        .hash(
          data: "\(secretKey)\(i)"
            .data(using: .utf8)!
        )
        .flatMap { String(format: "%02hhx", $0) }

      if (digest.prefix(5).allSatisfy { $0 == "0"}) {
        return i
      }
    }
  }
}
