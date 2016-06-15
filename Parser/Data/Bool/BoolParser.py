from Parser.Parser import Parser
from Parser.Data.VariableParser import VariableParser
from Parser.Data.Bool.AndParser import AndParser
from Parser.Data.Bool.OrParser import OrParser
from Parser.Data.Bool.EqualsParser import EqualsParser
from Parser.Data.Bool.NotEqualsParser import NotEqualsParser
from Expressions.Bool import Bool

class BoolParser(Parser):

    def __init__(self, text, context):
        super(BoolParser, self).__init__(text, context)
        self.internal += [self.parse_true, self.parse_false]
        from Parser.Data.Bool.NotParser import NotParser
        self.sub_parsers += [NotParser, EqualsParser, NotEqualsParser, AndParser, OrParser, VariableParser]

    def parser_default(self):
        return BoolParser

    def parse_true(self):
        if self.advance_string("true"):
            return Bool(True)
        if self.advance_string("yass"):
            return Bool(True)

    def parse_false(self):
        if self.advance_string("false"):
            return Bool(False)
        if self.advance_string("nope"):
            return Bool(False)