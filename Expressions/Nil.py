from Expressions.Expr import Expr

class Nil(Expr):

    def __init__(self):
        self.text = "nil"

    def eval(self):
        raise Exception("Unsafe unwrapping of nil")

    def to_cli(self):
        return "nil"

    @staticmethod
    def data():
        return "nil"
