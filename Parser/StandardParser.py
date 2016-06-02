from Parser.Parser import Parser
from Parser.Data.VariableParser import VariableParser
from Parser.Data.Numbers.NumberParser import NumberParser
from Parser.PrecedenceManager import PrecedenceManager

class StandardParser(Parser):

    def __init__(self, text, context):
        text = PrecedenceManager.prepare_precedence(text)
        super(StandardParser, self).__init__(text, context)
        self.internal = []
        self.sub_parsers += [NumberParser, VariableParser]

    def parser_default(self):
        return StandardParser

