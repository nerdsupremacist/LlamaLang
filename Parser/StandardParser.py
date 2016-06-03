from Parser.Parser import Parser
from Parser.Data.VariableParser import VariableParser
from Parser.Data.VariableDeclarationParser import VariableDeclarationParser
from Parser.Data.Function.FunctionDeclarationParser import FunctionDeclarationParser
from Parser.Data.Function.FunctionCallParser import FunctionCallParser
from Parser.Data.Numbers.NumberParser import NumberParser
from Parser.Data.String.StringParser import StringParser
from Parser.Data.Bool.BoolParser import BoolParser
from Parser.PrecedenceManager import PrecedenceManager

class StandardParser(Parser):

    def __init__(self, text, context):
        text = PrecedenceManager.prepare_precedence(text)
        super(StandardParser, self).__init__(text, context)
        self.internal = []
        self.sub_parsers += [VariableDeclarationParser, BoolParser, NumberParser, StringParser, VariableParser]
        self.sub_parsers += [FunctionDeclarationParser, FunctionCallParser]

    def parser_default(self):
        return StandardParser
