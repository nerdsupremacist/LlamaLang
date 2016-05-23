from Expressions.Var import Var
class OptionalVar(Var):

    def __init__(self, name, context):
        super(name, context)

    def to_cli(self):
        return self.name + ": " + str(self.type()) + "? = " + str(self.eval())

    # TODO: Implement Optionals
