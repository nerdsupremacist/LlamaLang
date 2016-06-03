from Parser.Data.Numbers.BinaryOperationParser import BinaryOperationParser
from Expressions.Operations.Minus import Minus

class MinusParser(BinaryOperationParser):

    def __init__(self, text, context):
        from Parser.Data.Numbers.NumberParser import NumberParser
        super(MinusParser, self).__init__(text, context, "-", NumberParser)

    def create(self, left, right):
        return Minus(left, right)



