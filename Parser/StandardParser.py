from Parser.Parser import Parser
from Parser.VariableParser import VariableParser
from Parser.Numbers.NumberParser import NumberParser

class StandardParser(Parser):

    def __init__(self, text, context):
        super(StandardParser, self).__init__(text, context)
        self.sub_parsers += [NumberParser, VariableParser]