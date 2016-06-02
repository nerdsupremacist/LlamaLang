from Parser.Numbers.BinaryNumberOperationParser import BinaryNumberOperationParser
from Expressions.Operations.Minus import Minus

class MinusParser(BinaryNumberOperationParser):

    def __init__(self, text, context):
        super(MinusParser, self).__init__(text, context)

    def create(self, left, right):
        return Minus(left, right)

    def operation_string(self):
        return "-"

