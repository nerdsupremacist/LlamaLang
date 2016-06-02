from Parser.Numbers.AbstractNumberParser import AbstractNumberParser
from Expressions.Number import Number

from Parser.VariableParser import VariableParser
from Parser.Numbers.TimesParser import TimesParser
from Parser.Numbers.DivisionParser import DivisionParser
from Parser.Numbers.MinusParser import MinusParser
from Parser.Numbers.PlusParser import PlusParser
from Parser.Numbers.PowParser import PowParser

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


