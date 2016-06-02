from Parser.Data.Numbers.AbstractNumberParser import AbstractNumberParser
from Expressions.Number import Number

from Parser.Data.VariableParser import VariableParser
from Parser.Data.Numbers.TimesParser import TimesParser
from Parser.Data.Numbers.DivisionParser import DivisionParser
from Parser.Data.Numbers.MinusParser import MinusParser
from Parser.Data.Numbers.PlusParser import PlusParser
from Parser.Data.Numbers.PowParser import PowParser

class NumberParser(AbstractNumberParser):

    def __init__(self, text, context):
        super(NumberParser, self).__init__(text, context)
        AbstractNumberParser.set_parser(NumberParser)
        self.internal += [self.parse_number]
        self.sub_parsers = [PowParser, DivisionParser, TimesParser, PlusParser, MinusParser, VariableParser]

    def parser_default(self):
        return NumberParser

    def parse_number(self):
        result = ''
        is_float = False
        if self.current_char == "-":
            result += self.current_char
            self.advance()
        while self.current_char is not None and self.current_char.isdigit():
            result += self.current_char
            self.advance()
        if self.current_char == '.':
            is_float = True
            result += '.'
            self.advance()
        while self.current_char is not None and self.current_char.isdigit():
            result += self.current_char
            self.advance()
        if len(result) > 0:
            if is_float:
                return Number(float(result))
            return Number(int(result))
        else:
            return None


