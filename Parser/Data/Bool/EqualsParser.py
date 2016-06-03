from Parser.Data.Numbers.BinaryOperationParser import BinaryOperationParser
from Expressions.Operations.Equals import Equals

class EqualsParser(BinaryOperationParser):

    def __init__(self, text, context):
        from Parser.StandardParser import StandardParser
        super(EqualsParser, self).__init__(text, context, "=", StandardParser)

    def create(self, left, right):
        return Equals(left, right)