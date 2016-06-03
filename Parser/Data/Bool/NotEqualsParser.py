from Parser.Data.Numbers.BinaryOperationParser import BinaryOperationParser
from Expressions.Operations.NotEquals import NotEquals

class NotEqualsParser(BinaryOperationParser):

    def __init__(self, text, context):
        from Parser.StandardParser import StandardParser
        super(NotEqualsParser, self).__init__(text, context, "!=", StandardParser)

    def create(self, left, right):
        return NotEquals(left, right)