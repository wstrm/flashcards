import sequtils
import ../lib/game

proc play() =
  var answer: string
  var score: int
  var win: bool = true

  for c in randomCards(@[
      Card(question: "x -> 0: sin(x)/x", answers: @["1"]),
      Card(question: "x -> 0+: (x^a)ln(x) [a > 0]", answers: @["0"]),
      Card(question: "x -> 0: tan(x)/x", answers: @["1"]),
      Card(question: "x -> 0: ln(x+1)/x", answers: @["1"]),
      Card(question: "x -> 0: ((e^x)-1)/x", answers: @["1"]),
      Card(question: "x -> 0: (1+x)^(1/x)", answers: @["e"]),
      Card(question: "x -> 0: arcsin(x)/x", answers: @["1"]),
      Card(question: "x -> 0: arctan(x)/x", answers: @["1"]),
      Card(question: "x -> ∞: ln(x)/(x^a) [a > 0]", answers: @["0"]),
      Card(question: "x -> ∞: (x^a)/(a^x) [a > 1]", answers: @["0"]),
      Card(question: "n -> ∞: a^n [|a| < 1]", answers: @["0"]),
      Card(question: "n -> ∞: a^n [a = 1]", answers: @["1"]),
      Card(question: "n -> ∞: a^n [a > 1]", answers: @["∞", "undef", "undefined", "inf", "infinity"]),
      Card(question: "n -> ∞: (n^a)/(a^n) [a > 1]", answers: @["0"]),
      Card(question: "n -> ∞: (a^n)/(n!)", answers: @["0"]),
      Card(question: "n -> ∞: (n!)/(n^n)", answers: @["0"]),
      Card(question: "n -> ∞: sqrt_n(n^a)", answers: @["1"]),
      Card(question: "n -> ∞: (1+(1/n))^n", answers: @["e"])
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
