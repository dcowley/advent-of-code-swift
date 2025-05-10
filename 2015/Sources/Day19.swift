import Foundation

struct Day19: AdventDay {
  let data: String

  private var replacements: [String: [String]] {
    data.split(separator: /\n\n/)[0]
      .matches(of: /^(?'source'[A-Za-z]{1}[a-z]{,1}) => (?'replacement'[A-Za-z]+)$/.anchorsMatchLineEndings())
      .map {
        (String($0.output.source), String($0.output.replacement))
      }
      .reduce(into: [String:[String]]()) { result, mapping in
        result[mapping.0, default: []].append(mapping.1)
      }
  }
  private var molecole: String {
    String(data.split(separator: /\n\n/)[1])
  }

  func part1() -> Int {
    let all = replacements.flatMap { key, values in
      values.flatMap { value in
        molecole.matches(of: try! Regex(key)).map { match in
          var molecole = molecole
          molecole.replaceSubrange(match.range, with: value)
          return molecole
        }
      }
    }.uniqued()

    return Set(all).count
  }
}
