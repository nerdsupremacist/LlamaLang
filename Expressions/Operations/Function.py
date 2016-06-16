from Expressions.Var import Var
from Expressions.Expr import Expr
from Expressions.Nil import Nil
from Context import Context
import re

class Function(Expr):

    def __init__(self, parameters, context, code, change_code):
        self.parameters = []
        self.context = Context(context)
        self.code = code + " "
        self.applied = []
        if change_code:
            for i in range(len(parameters)):
                self.parameters.append("__" + str(i))
                pattern = re.compile("\W" + parameters[i] + "\W")
                results = pattern.findall(self.code)
                for res in results:
                    self.code = self.code.replace(res, res.replace(parameters[i], "__" + str(i)))
        else:
            self.parameters = parameters

    def get_parent_context(self):
        return self.context.parent_context

    def apply(self, params):
        self.applied = params

    def get(self):
        self.context = Context(self.get_parent_context())
        if len(self.parameters) < len(self.applied):
            raise Exception("Invalid Not All Parameters Applied.")
        for i in range(len(self.applied)):
            if isinstance(self.applied[i], Var):
                self.context.setValueForVar(self.parameters[i], self.applied[i].get())
            else:
                self.context.setValueForVar(self.parameters[i], self.applied[i])
        if len(self.parameters) != len(self.applied):
            result = Function(self.parameters[len(self.applied):], self.context, self.code, False)

        from Parser.StandardParser import StandardParser
        parser = StandardParser(self.code, self.context)
        parsed = parser.parse()
        if parsed is None:
            return Nil()
        self.applied = []
        return parsed

    def eval(self):
        return self.get().eval()

    def min(self):
        if len(self.applied) == len(self.parameters):
            return self.get()
        return self

    def type(self):
        if len(self.applied) > 0:
            return self.outputType()
        return Function

    def outputType(self):
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
            return self.get().to_cli()
        return "Function " + str(self.parameters) + " -> " + self.outputType().data()