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

class NaN(Expr):

    def __init__(self):
        return

    def eval(self):
        raise Exception("Forced calculation with NaN.")

    def to_cli(self):
        return "NaN"

    @staticmethod
    def data():
        return "NaN"