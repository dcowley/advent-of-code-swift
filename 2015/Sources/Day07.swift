import CryptoKit
import Foundation
import Shared

enum Operation {
  case eq(a: String)
  case or(a: String, b: String)
  case and(a: String, b: String)
  case xor(a: String, b: String)
  case shl(a: String, bits: Int)
  case shr(a: String, bits: Int)
  case not(a: String)
}

struct Day07: AdventDay {
  var data: String
  var wire: String

  init(data: String) {
    self.init(data: data, wire: "a")
  }

  init(data: String, wire: String) {
    self.data = data
    self.wire = wire
  }

  private var circuit: [String : Operation] {
    Dictionary(uniqueKeysWithValues: data.split(separator: "\n").compactMap {
      let line = $0.trimmingPrefix(/\ */)
      if let match = line.wholeMatch(of: /(?'a'\w+) -> (?'var'\w+)/) {
        return (String(match.output.var), .eq(a: String(match.output.a)))
      }
      if let match = line.wholeMatch(of: /(?'a'\w+) OR (?'b'\w+) -> (?'var'\w+)/) {
        return (String(match.output.var), .or(a: String(match.output.a), b: String(match.output.b)))
      }
      if let match = line.wholeMatch(of: /(?'a'\w+) AND (?'b'\w+) -> (?'var'\w+)/) {
        return (String(match.output.var), .and(a: String(match.output.a), b: String(match.output.b)))
      }
      if let match = line.wholeMatch(of: /(?'a'\w+) XOR (?'b'\w+) -> (?'var'\w+)/) {
        return (String(match.output.var), .xor(a: String(match.output.a), b: String(match.output.b)))
      }
      if let match = line.wholeMatch(of: /(?'a'\w+) LSHIFT (?'bits'\d+) -> (?'var'\w+)/) {
        return (String(match.output.var), .shl(a: String(match.output.a), bits: Int(match.output.bits)!))
      }
      if let match = line.wholeMatch(of: /(?'a'\w+) RSHIFT (?'bits'\d+) -> (?'var'\w+)/) {
        return (String(match.output.var), .shr(a: String(match.output.a), bits: Int(match.output.bits)!))
      }
      if let match = line.wholeMatch(of: /NOT (?'a'\w+) -> (?'var'\w+)/) {
        return (String(match.output.var), .not(a: String(match.output.a)))
      }
      return nil
    })
  }

  private func solve(override: UInt16? = nil) -> UInt16 {
    var wires = [String: UInt16]()
    if let override = override {
      wires["b"] = override
    }

    func emulate(_ wire: String) -> UInt16 {
      if let value = wires[wire] {
        return value
      }

      guard let operation = circuit[wire] else {
        if let value = UInt16(wire) {
          return value
        }
        fatalError("Wire \(wire) not found in circuit")
      }

      let value = switch operation {
      case .eq(let a):
        emulate(a)
      case .or(a: let a, b: let b):
        emulate(a) | emulate(b)
      case .and(a: let a, b: let b):
        emulate(a) & emulate(b)
      case .xor(a: let a, b: let b):
        emulate(a) ^ emulate(b)
      case .shl(a: let a, bits: let bits):
        emulate(a) << bits
      case .shr(a: let a, bits: let bits):
        emulate(a) >> bits
      case .not(a: let a):
        ~emulate(a)
      }
      wires[wire] = value
      return value
    }

    return emulate(self.wire)
  }

  func part1() -> UInt16 {
    solve()
  }

  func part2() -> UInt16 {
    solve(override: part1())
  }
}
