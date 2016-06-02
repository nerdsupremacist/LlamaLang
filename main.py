from Interpreter import Interpreter
from Context import Context
from Foundation.FoundationContext import FoundationContext
from Parser.StandardParser import StandardParser

def main():
    context = Context(FoundationContext.simple())
    while True:
        try:
            text = input('llama.py> ')
        except EOFError:
            break
        if not text:
            continue
        inter = StandardParser(text, context)
        result = inter.parse().parsedObject.to_cli()
        if result is not None:
            print(result)


if __name__ == '__main__':
    main()
