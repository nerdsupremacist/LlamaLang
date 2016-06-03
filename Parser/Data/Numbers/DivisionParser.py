from Parser.Data.Numbers.BinaryOperationParser import BinaryOperationParser
from Expressions.Operations.Division import Division

class DivisionParser(BinaryOperationParser):

    def __init__(self, text, context):
        from Parser.Data.Numbers.NumberParser import NumberParser
        super(DivisionParser, self).__init__(text, context, "/", NumberParser)

    def create(self, left, right):
        return Division(left, right)

