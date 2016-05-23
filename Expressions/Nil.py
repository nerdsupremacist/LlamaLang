from Expressions.Expr import Expr

class Nil(Expr):

    def __init__(self):
        return

    def eval(self):
        raise Exception("Unsafe unwrapping of nil")

    def print(self):
        return "nil"

    @staticmethod
    def data():
        return "nil"