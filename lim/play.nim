import random
import terminal
import strformat
import sequtils

type
  Card = object
    question: string
    answers: seq[string]

iterator randomCards(cards: openarray[Card]): Card =
  randomize()
  while true:
    yield sample(cards)

proc print_question(question: string) = stdout.write(&"{question} = ")

proc print_gameboard(score: int, win: bool) =
  let scoreColor = if win: fgGreen else: fgRed
  eraseScreen(stdout)
  setCursorPos(0, 0)
  styledWriteLine(stdout, fgBlue, "Score", resetStyle, ": " ,
                  scoreColor, $(score), resetStyle)


proc play() =
  var answer: string
  var score: int
  var win: bool = true

  for c in randomCards(@[
      Card(question: "sin(x)/x", answers: @["1"]),
      Card(question: "(x^a)ln(x) [a > 0]", answers: @["0"]),
      Card(question: "cos(x)", answers: @["1"]),
      Card(question: "(x^a)(e^x) [a > 0]", answers: @["0"]),
    ]):

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
