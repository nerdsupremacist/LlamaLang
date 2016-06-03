from Parser.Data.Numbers.BinaryOperationParser import BinaryOperationParser
from Expressions.Operations.LogicalOr import LogicalOr

class OrParser(BinaryOperationParser):

    def __init__(self, text, context):
        from Parser.Data.Bool.BoolParser import BoolParser
        super(OrParser, self).__init__(text, context, "|", BoolParser)

    def create(self, left, right):
        return LogicalOr(left, right)