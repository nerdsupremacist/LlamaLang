from Expressions.Expr import Expr
class Bool(Expr):

    def __init__(self, value):
        self.value = value

    def eval(self):
        return self.value

    def type(self):
        return Bool

    def to_cli(self):
        if self.eval():
            return "true (Bool)"
        return "false (Bool)"

    @staticmethod
    def data():
        return "Bool"
