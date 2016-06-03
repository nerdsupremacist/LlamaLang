from Parser.Data.Numbers.BinaryOperationParser import BinaryOperationParser
from Expressions.Operations.Times import Times

class TimesParser(BinaryOperationParser):

    def __init__(self, text, context):
        from Parser.Data.Numbers.NumberParser import NumberParser
        super(TimesParser, self).__init__(text, context, "*", NumberParser)

    def create(self, left, right):
        return Times(left, right)

