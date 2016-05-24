from Expressions.Bool import Bool

class Equals(Bool):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def eval(self):
        if self.left.type() == self.right.type():
            return self.left.eval() == self.right.eval()
        else:
            raise Exception('Invalid Input: ' + self.left.eval() + " and " + self.right.eval() + " are not comparable")

    def type(self):
        return Bool
