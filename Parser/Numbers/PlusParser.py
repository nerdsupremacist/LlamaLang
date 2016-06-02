from Parser.Numbers.BinaryNumberOperationParser import BinaryNumberOperationParser
from Expressions.Operations.Plus import Plus

class PlusParser(BinaryNumberOperationParser):

    def __init__(self, text, context):
        super(PlusParser, self).__init__(text, context)

    def create(self, left, right):
        return Plus(left, right)

    def operation_string(self):
        return "+"