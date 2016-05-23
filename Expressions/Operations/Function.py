from Expressions.Expr import Expr
from Context import Context
import Interpreter

class Function(Expr):

    def __init__(self, parameters, context, code):
        self.parameters = parameters
        self.context = Context(context)
        self.code = code
        self.applied = []

    def get_parent_context(self):
        return self.context.parent_context

    def apply(self, params):
        self.applied = params

    def eval(self):
        self.context = Context(self.get_parent_context())
        if len(self.parameters) != len(self.parameters):
            raise Exception("Invalid Not All Parameters Applied.")
        for i in range(len(self.parameters)):
            self.context.setValueForVar(self.parameters[i], self.applied[i])
        inter = Interpreter.Interpreter(self.context, self.code)
        self.applied = []
        return inter.parse().eval()

    def type(self):
        return Function

    def data(self):
        return "Function: "

    def to_cli(self):
        if len(self.applied) > 0:
            return str(self.eval())
        return str(self.parameters) + " -> ()"

