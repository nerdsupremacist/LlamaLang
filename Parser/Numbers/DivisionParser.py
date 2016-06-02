from Parser.Numbers.BinaryNumberOperationParser import BinaryNumberOperationParser
from Expressions.Operations.Division import Division

class DivisionParser(BinaryNumberOperationParser):

    def __init__(self, text, context):
        super(DivisionParser, self).__init__(text, context)

    def create(self, left, right):
        return Division(left, right)

    def operation_string(self):
        return "/"

