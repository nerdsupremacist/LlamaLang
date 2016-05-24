from Expressions.Expr import Expr
from Expressions.Nil import Nil

class ExceptionClass(Expr):

    def __init__(self, ex):
        self.exception = ex

    def type(self):
        return Nil

    def to_cli(self):
        return "Error: " + str(self.exception)

    def eval(self):
        raise Exception(str(self.exception))
