from Parser.Data.Numbers.BinaryOperationParser import BinaryOperationParser
from Expressions.Operations.LogicalAnd import LogicalAnd

class AndParser(BinaryOperationParser):

    def __init__(self, text, context):
        from Parser.Data.Bool.BoolParser import BoolParser
        super(AndParser, self).__init__(text, context, "&", BoolParser)

    def create(self, left, right):
        return LogicalAnd(left, right)