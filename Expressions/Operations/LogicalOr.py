from Expressions.Bool import Bool


class LogicalOr(Bool):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def eval(self):
        if self.left.type() == Bool and self.right.type() == Bool:
            return self.left.eval() or self.right.eval()
        else:
            raise Exception('Invalid Input: Not Bools')


    def type(self):
        return Bool
