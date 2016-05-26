from Expressions.Expr import Expr
import re
class String(Expr):

    def __init__(self, text):
        self.text = text

    def eval(self):
        return self.text

    def type(self):
        return String

    def copy(self):
        return String(self.text)

    def min(self):
        return String(self.eval())

    def to_cli(self):
        return "\"" + self.eval() + "\"" + " (String)"

    @staticmethod
    def data():
        return "String"
