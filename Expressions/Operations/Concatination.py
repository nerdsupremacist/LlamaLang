from Expressions.String import String
class Concatination(String):

    def __init__(self, left, right):
        self.left = left
        self.right = right

    def eval(self):
        return str(self.left.eval()) + str(self.right.eval())

    def type(self):
        return String