from Expressions.Expr import Expr

class IfThenElse(Expr):

    def __init__(self, condition, then_block, else_block, context):
        self.condition = condition
        self.then_block = then_block
        self.else_block = else_block
        self.context = context

    def eval(self):
        result_of_condition = self.condition.eval()
        from Parser.StandardParser import StandardParser
        if result_of_condition:
            return StandardParser(self.then_block, self.context).parse().eval()
        else:
            return StandardParser(self.else_block, self.context).parse().eval()

    def min(self):
        result_of_condition = self.condition.eval()
        from Parser.StandardParser import StandardParser
        if result_of_condition:
            return StandardParser(self.then_block, self.context).parse().min()
        else:
            return StandardParser(self.else_block, self.context).parse().min()

    def type(self):
        from Parser.StandardParser import StandardParser
        parsed_then = StandardParser(self.then_block, self.context).parse()
        return parsed_then.type()

    def copy(self):
        return IfThenElse(self.condition.copy(), self.then_block.copy(), self.else_block.copy())
