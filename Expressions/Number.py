from Expressions.Expr import Expr


class Number(Expr):

    def __init__(self, value):
        self.value = value

    def eval(self):
        return self.value

    def type(self):
        return Number

    def to_cli(self):
        return str(self.eval()) + " (Number)"

    @staticmethod
    def data():
        return "Number"
