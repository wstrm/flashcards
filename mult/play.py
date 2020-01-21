from itertools import product
from random import choice
from sys import exit

def print_gameboard(score):
    print("\033c", end="")
    print("Score: %d\n" % score)
    print("Ctrl+D to exit.\n")

def print_question(x, y):
    print("%d x %d = " % (x, y), end="")

def end():
    print("\nGoodbye.")
    exit()

def setup():
    print_gameboard(0)
    print("Please pick an (inclusive) interval of the numbers to play with.")

    try:
        x = int(input("Min = "))
        y = int(input("Max = "))
    except EOFError:
        end()
    except ValueError:
        return setup()

    return (x, y)

def play(imin, imax):
    score = 0
    table = tuple(product(range(imin, imax+1), repeat=2))

    while True:
        x, y = choice(table)
        d = x*y

        while True:
            print_gameboard(score)
            print_question(x, y)

            try:
                i = int(input())
            except EOFError:
                end()
            except ValueError:
                continue

            if i == d:
                score += 1
                break
            else:
                score -= 1

play(*setup())
