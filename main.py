from Interpreter import Interpreter
from Context import Context

def main():
    context = Context()
    while True:
        try:
            text = input('llama> ')
        except EOFError:
            break
        if not text:
            continue
        inter = Interpreter(context, text)
        result = inter.result()
        print(result)


if __name__ == '__main__':
    main()
