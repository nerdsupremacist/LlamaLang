from Parser.Parser import Parser
from Parser.Data.String.StringConcatenationParser import StringConcatenationParser
from Parser.Data.VariableParser import VariableParser
from Parser.Data.Numbers.NumberParser import NumberParser
from Expressions.String import String

class StringParser(Parser):

    def __init__(self, text, context):
        super(StringParser, self).__init__(text, context)
        self.internal += [self.parse_string]
        self.sub_parsers += [StringConcatenationParser, VariableParser, NumberParser]

    def parser_default(self):
        return StringParser

    def parse_string(self):
        result = ''
        if self.advance_string("\""):
            result = self.advance_until("\"")
            return String(result)
        return None
