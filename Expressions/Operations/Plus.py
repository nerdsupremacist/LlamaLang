from Expressions.Number import Number
from Expressions.String import String
from Expressions.Operations.Concatination import Concatination


class Plus(Number):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def eval(self):
        if self.left.type() == String or self.right.type() == String:
            return Concatination(self.left, self.right).eval()
        if self.left.type() == Number and self.right.type() == Number:
            return self.left.eval() + self.right.eval()
        else:
            raise Exception('Invalid Input: Not Numbers')

    def type(self):
        if self.left.type() == String or self.right.type() == String:
            return String
        return Number
