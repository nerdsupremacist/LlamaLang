from Expressions.Operations.Equals import Equals
from Expressions.Operations.Not import Not

class NotEquals(Equals):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def eval(self):
        equ = Equals(self.left, self.right)
        return Not(equ).eval()

