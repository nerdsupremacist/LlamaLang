from Parser import Parser
from Expressions.Var import Var

class VariableParser(Parser.Parser):

    def __init__(self, text, context):
        super(VariableParser, self).__init__(text, context)
        self.internal += [self.parse_variable]

    def parser_default(self):
        return VariableParser

    def parse_variable(self):
        self.skip_whitespace()
        result = ''
        while self.current_char is not None and self.current_char.isalpha():
            result += self.current_char
            self.advance()
        self.skip_whitespace()
        if self.current_char is None:
            return Var(result, self.context)
        return None
