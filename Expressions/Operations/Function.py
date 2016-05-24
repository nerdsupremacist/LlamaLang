from Expressions.Var import Var
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
        if len(self.parameters) != len(self.applied):
            raise Exception("Invalid Not All Parameters Applied.")
        for i in range(len(self.parameters)):
            if isinstance(self.applied[i], Var):
                self.context.setValueForVar(self.parameters[i], self.applied[i].get())
            else:
                self.context.setValueForVar(self.parameters[i], self.applied[i])
        inter = Interpreter.Interpreter(self.context, self.code)
        self.applied = []
        return inter.parse().eval()

    def type(self):
        if len(self.applied) > 0:
            return self.outputType()
        return Function

    def outputType(self):
        try:
            interpreter = Interpreter.Interpreter(self.context, self.code)
            result = interpreter.parse()
            type = result.type()
            if type == None:
                return Expr
            return type
        except Exception as e:
            return Expr

    @staticmethod
    def data():
        return "Function: "

    def copy(self):
        f = Function(self.parameters, self.context.parent_context, self.code)
        f.applied = self.applied
        return f

    def to_cli(self):
        if len(self.applied) > 0:
            return str(self.eval())
        return "Function " + str(self.parameters) + " -> " + self.outputType().data()
