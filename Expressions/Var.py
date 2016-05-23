from Expressions.Expr import Expr


class Var(Expr):

    def __init__(self, name, context):
        self.name = name
        self.context = context

    def type(self):
        return self.context.typeForVar(self.name)

    def set(self, value):
        self.context.setValueForVar(self.name, value)

    def eval(self):
        return self.context.valueForVar(self.name)
