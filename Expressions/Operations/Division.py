from Expressions.Number import Number


class Division(Number):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def eval(self):
        if self.left.type() == Number and self.right.type() == Number:
            return self.left.eval() / self.right.eval()
        else:
            raise Exception('Invalid Input: Not Numbers')

    def type(self):
        return Number
