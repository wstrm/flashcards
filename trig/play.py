from itertools import product
from random import choice
from sys import exit

def random_cards(cards):
    while True:
        yield choice(cards)

def print_gameboard(score):
    print("\033c", end="")
    print("Score: %d\n" % score)
    print("Ctrl+D to exit.\n")

def print_question(question):
    print(f"{question} = ", end="")

def end():
    print("\nGoodbye.")
    exit()

def play():
    score = 0

    for card in random_cards((
            ("sin(0)", "0"),
            ("sin(pi/6)", "1/2", "0.5"),
            ("sin(pi/4)", "sqrt(2)/2", "1/sqrt(2)"),
            ("sin(pi/3)", "sqrt(3)/2"),
            ("sin(pi/2)", "1"),
            ("sin(2pi/3)", "sqrt(3)/2"),
            ("sin(3pi/4)", "sqrt(2)/2", "1/sqrt(2)"),
            ("sin(5pi/6)", "1/2"),
            ("sin(pi)", "0"),

            ("cos(0)", "1"),
            ("cos(pi/6)", "sqrt(3)/2"),
            ("cos(pi/4)", "sqrt(2)/2", "1/sqrt(2)"),
            ("cos(pi/3)", "1/2"),
            ("cos(pi/2)", "0"),
            ("cos(2pi/3)", "-1/2"),
            ("cos(3pi/4)", "-sqrt(2)/2", "-1/sqrt(2)"),
            ("cos(5pi/6)", "-sqrt(3)/2"),
            ("cos(pi)", "-1"))):
        while True:
            print_gameboard(score)
            print_question(card[0])

            try:
                answer = str(input())
            except EOFError:
                end()
            except ValueError:
                continue

            if any(answer == correct for correct in card[1:]):
                score += 1
                break
            else:
                score -= 1

play()
