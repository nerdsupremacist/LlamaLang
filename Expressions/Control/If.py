from Expressions.Expr import Expr

class IfThenElse(Expr):

    def __init__(self, condition, then_block, else_block):
        self.condition = condition
        self.then_block = then_block
        self.else_block = else_block

    def eval(self):
        result_of_condition = self.condition.eval()
        if result_of_condition:
            return self.then_block.eval()
        else:
            return self.else_block.eval()

    def min(self):
        result_of_condition = self.condition.eval()
        if result_of_condition:
            return self.then_block.min()
        else:
            return self.else_block.min()

    def type(self):
        return self.then_block.type()

    def copy(self):
        return IfThenElse(self.condition.copy(), self.then_block.copy(), self.else_block.copy())
