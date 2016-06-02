from Parser.Numbers.BinaryNumberOperationParser import BinaryNumberOperationParser
from Expressions.Operations.Times import Times

class TimesParser(BinaryNumberOperationParser):

    def __init__(self, text, context):
        super(TimesParser, self).__init__(text, context)

    def create(self, left, right):
        return Times(left, right)

    def operation_string(self):
        return "*"