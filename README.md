# Advent of Code Swift

[![Language](https://img.shields.io/badge/language-Swift-red.svg)](https://swift.org)

A Swift project to solve the daily programming puzzles presented during **Advent of Code[^aoc]**, created using the [Advent of Code Swift Starter Project][template].

## Structure

```
.
├── AdventOfCode.xcworkspace
└── YYYY                            AoC year
    ├── Package.swift               
    ├── Sources
    |   ├── AdventDay.swift         Puzzle protocol and extensions
    |   ├── AdventOfCode.swift      Puzzle runner
    |   ├── DayN.swift              Solution for the Nth day puzzle
    |   └── Data
    |       └── DayN.txt            Input data provided for the Nth day puzzle
    └── Tests
        └── DayN.swift              Unit tests for the Nth day puzzle
```

[^aoc]: [Advent of Code][aoc] – An annual event of Christmas-oriented programming challenges started December 2015.
Every year since then, beginning on the first day of December, a programming puzzle is published every day for twenty-five days.
You can solve the puzzle and provide an answer using the language of your choice.

[aoc]: https://adventofcode.com
[template]: https://github.com/swiftlang/swift-aoc-starter-example
