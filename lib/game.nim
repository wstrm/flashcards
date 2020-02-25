import random
import terminal
import strformat

type
  Card* = object
    question*: string
    answers*: seq[string]

iterator randomCards*(cards: openarray[Card]): Card =
  randomize()
  while true:
    yield sample(cards)

proc print_question*(question: string) = stdout.write(&"{question} = ")

proc print_gameboard*(score: int, win: bool) =
  let scoreColor = if win: fgGreen else: fgRed
  eraseScreen(stdout)
  setCursorPos(0, 0)
  styledWriteLine(stdout, fgBlue, "Score", resetStyle, ": " ,
                  scoreColor, $(score), resetStyle)
