from Parser.Data.Bool.BoolParser import BoolParser
from Expressions.Operations.Not import Not

class NotParser(BoolParser):

    def __init__(self, text, context):
        super(NotParser, self).__init__(text, context)
        self.internal = [self.parse_negation]
        self.sub_parsers = []

    def parse_negation(self):
        if self.advance_string("!"):
            rest = self.text[self.pos:]
            original = BoolParser(rest, self.context).parse()
            if original is not None:
                self.finish()
                return Not(original)
        return None

