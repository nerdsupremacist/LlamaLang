from Expressions.Expr import Expr

class Var(Expr):

    def __init__(self, name, context):
        self.name = name
        self.context = context

    def type(self):
        return self.context.typeForVar(self.name)

    def set(self, value):
        self.context.setValueForVar(self.name, value)

    def get(self):
        return self.context.valueForVar(self.name)

    def min(self):
        if self.type() is None:
            return self
        return self.get()

    def eval(self):
        return self.get().eval()

    def to_cli(self):
        return self.name + " = " + self.get().to_cli()
