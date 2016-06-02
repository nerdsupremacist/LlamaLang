from Parser.ParsedResult import ParsedResult
from Expressions.Nil import Nil
from Expressions.Exception import ExceptionClass

class Parser(object):

    def __init__(self, text, context):
        self.text = text
        self.context = context
        self.sub_parsers = []
        self.internal = [self.parse_brackets]
        self.pos = 0
        if len(text) > 0:
            self.current_char = self.text[self.pos]
        else:
            self.current_char = None

    def parser_default(self):
        return Parser

    def advance(self):
        self.pos += 1
        if self.pos > len(self.text) - 1:
            self.current_char = None
        else:
            self.current_char = self.text[self.pos]

    def start_over(self):
        self.pos = 0
        if len(self.text) > 0:
            self.current_char = self.text[self.pos]
        else:
            self.current_char = None

    def finish(self):
        self.pos = len(self.text)
        self.current_char = None

    def go_back(self):
        self.pos -= 1
        if self.pos < 0:
            self.current_char = None
        else:
            self.current_char = self.text[self.pos]

    def advance_string(self, string):
        for i in range(len(string)):
            char = string[i]
            if self.current_char is None or self.current_char != char:
                for j in range(i):
                    self.go_back()
                return False
            self.advance()
        return True

    def advance_until(self, string):
        res = ''
        while not self.advance_string(string):
            res += self.current_char
            self.advance()
        return res

    def skip_whitespace(self):
        while self.current_char is not None and self.current_char.isspace():
            self.advance()

    def parse_brackets(self):
        if self.current_char == '(':
            result = ''
            bracket_count = 1
            self.advance()
            while self.current_char is not None:
                if self.current_char == "(":
                    bracket_count += 1
                if self.current_char == ")":
                    bracket_count -= 1
                if bracket_count == 0:
                    self.advance()
                    sub_parser = self.parser_default()(result, self.context)
                    parsed = sub_parser.parse()
                    if parsed is None:
                        return None
                    return parsed.parsedObject
                result += self.current_char
                self.advance()
        return None

    def parse(self):
        self.start_over()
        for f in self.internal:
            self.skip_whitespace()
            parsed = f()
            self.skip_whitespace()
            if parsed is not None and self.current_char is None:
                return ParsedResult(parsed, self.text[self.pos:])
            else:
                self.start_over()
        for sub in self.sub_parsers:
            parsed = sub(self.text, self.context).parse()
            if parsed is not None:
                return parsed
        return None

    def to_cli(self):
        parsed = self.parse()
        if parsed is None:
            parsed = ParsedResult(Nil(), self.text)
        try:
            return parsed.parsedObject.to_cli()
        except Exception as e:
            return ExceptionClass(e).to_cli()
