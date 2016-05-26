from Expressions.Operations.Function import Function
from Expressions.Nil import Nil

# Will Handle STD:OUT

class Print(Function):

    def __init__(self, context):
        self.parameters = ["Str"]
        self.applied = []
        self.context = context

    def eval(self):
        if len(self.applied) == 1:
            print(self.applied[0].eval())
        return Nil

    def copy(self):
        return self

    def to_cli(self):
        if len(self.applied) == 1:
            self.eval()
            return None
        return "Function " + str(self.parameters) + " -> " + self.outputType().data()
