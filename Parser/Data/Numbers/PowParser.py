from Parser.Data.Numbers.BinaryOperationParser import BinaryOperationParser
from Expressions.Operations.Pow import Pow

class PowParser(BinaryOperationParser):

    def __init__(self, text, context):
        from Parser.Data.Numbers.NumberParser import NumberParser
        super(PowParser, self).__init__(text, context, "**", NumberParser)

    def create(self, left, right):
        return Pow(left, right)

