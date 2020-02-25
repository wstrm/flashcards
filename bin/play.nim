import ../lib/game
import sequtils
import math
import strformat

iterator powerTwo(start: int, stop: int): Card =
  for n in start..stop:
    yield Card(question: &"2^{n}", answers: @[$(2^n)])

proc play() =
  var answer: string
  var score: int
  var win: bool = true

  for c in game.randomCards(toSeq(powerTwo(0, 13))):
    print_gameboard(score, win)
    print_question(c.question)

    try:
      answer = readLine(stdin)
    except EOFError:
      echo "\nBye!"
      return

    if anyIt(c.answers, it == answer):
      score += 1
      win = true
    else:
      score -= 1
      win = false

play()
