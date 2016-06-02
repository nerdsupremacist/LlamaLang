from Parser.Numbers.BinaryNumberOperationParser import BinaryNumberOperationParser
from Expressions.Operations.Pow import Pow

class PowParser(BinaryNumberOperationParser):

    def __init__(self, text, context):
        super(PowParser, self).__init__(text, context)

    def create(self, left, right):
        return Pow(left, right)

    def operation_string(self):
        return "**"

