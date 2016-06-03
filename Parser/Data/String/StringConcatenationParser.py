from Parser.Data.Numbers.BinaryOperationParser import BinaryOperationParser
from Expressions.Operations.Concatination import Concatination

class StringConcatenationParser(BinaryOperationParser):

    def __init__(self, text, context):
        from Parser.Data.String.StringParser import StringParser
        super(StringConcatenationParser, self).__init__(text, context, "+", StringParser)

    def create(self, left, right):
        return Concatination(left, right)