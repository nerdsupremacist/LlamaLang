from Expressions.Expr import Expr


class Number(Expr):
    
    def __init__(self, value):
        self.value = value

    def eval(self):
        return self.value

    def type(self):
        return Number

    def print(self):
        return "Number: " + str(self.eval())

    @staticmethod
    def data():
        return "Number"