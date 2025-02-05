import Foundation

struct Day15: AdventDay {
  var data: String

  private var ingredients: [Ingredient] {
    data.matches(
      of: /^(?'name'\w+):.*?(?'capacity'-{,1}\d+).*?(?'durability'-{,1}\d+).*?(?'flavor'-{,1}\d+).*?(?'texture'-{,1}\d+).*?(?'calories'\d+)$/
        .anchorsMatchLineEndings()
    )
    .map { match in
      Ingredient(
        name: String(match.output.name),
        capacity: Int(match.output.capacity)!,
        durability: Int(match.output.durability)!,
        flavor: Int(match.output.flavor)!,
        texture: Int(match.output.texture)!,
        calories: Int(match.output.calories)!
      )
    }
  }

  private func combinations(total: Int, num: Int) -> [[Int]] {
    if num == 0 {
      return []
    }
    if num == 1 {
      return [[total]]
    }

    var result = [[Int]]()
    for i in 0...total {
      combinations(total: total - i, num: num - 1).forEach {
        var next = $0
        next.insert(i, at: 0)
        result.append(next)
      }
    }
    return result
  }

  func part1() -> Int {
    let ingredients = ingredients
    let combos = combinations(total: 100, num: ingredients.count)
      .map {
        let reduced = $0.indexed()
          .map { index, teaspoons in
            ingredients[index].score(teaspoons)
          }
          .reduce(Ingredient.Score.zero) { sum, score in
            sum + score
          }

        return reduced.total
      }
    return combos.max()!
  }

  func part2() -> Int {
    let ingredients = ingredients
    let combos = combinations(total: 100, num: ingredients.count)
      .map {
        $0.indexed()
          .map { index, teaspoons in
            ingredients[index].score(teaspoons)
          }
          .reduce(Ingredient.Score.zero) { sum, score in
            sum + score
          }
      }
      .filter { $0.calories == 500 }
      .map { $0.total }

    return combos.max()!
  }

  private struct Ingredient {
    let name: String
    let capacity: Int
    let durability: Int
    let flavor: Int
    let texture: Int
    let calories: Int

    struct Score {
      static let zero = Score(capacity: 0, durability: 0, flavor: 0, texture: 0, calories: 0)

      let capacity: Int
      let durability: Int
      let flavor: Int
      let texture: Int
      let calories: Int

      var total: Int {
        max(0, capacity) * max(0, durability) * max(0, flavor) * max(0, texture)
      }

      static func + (l: Score, r: Score) -> Score {
        Score(
          capacity: l.capacity + r.capacity,
          durability: l.durability + r.durability,
          flavor: l.flavor + r.flavor,
          texture: l.texture + r.texture,
          calories: l.calories + r.calories
        )
      }
    }

    func score(_ teaspoons: Int) -> Score {
      Score(
        capacity: capacity * teaspoons,
        durability: durability * teaspoons,
        flavor: flavor * teaspoons,
        texture: texture * teaspoons,
        calories: calories * teaspoons
      )
    }
  }
}
