from Parser.Data.Numbers.BinaryOperationParser import BinaryOperationParser
from Expressions.Operations.Plus import Plus

class PlusParser(BinaryOperationParser):

    def __init__(self, text, context):
        from Parser.Data.Numbers.NumberParser import NumberParser
        super(PlusParser, self).__init__(text, context, "+", NumberParser)

    def create(self, left, right):
        return Plus(left, right)
