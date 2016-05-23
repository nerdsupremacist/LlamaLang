from Expressions.Expr import Expr
class String(Expr):

    def __init__(self, text):
        self.text = text

    def eval(self):
        return self.text

    def type(self):
        return String

    def print(self):
        return "String: \"" + self.eval() + "\""

    @staticmethod
    def data():
        return "String"