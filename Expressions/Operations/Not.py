from Expressions.Bool import Bool

class Not(Bool):
    def __init__(self, value):
        self.value = value

    def eval(self):
        if self.value.type() == Bool:
            return not self.value.eval()
        else:
            raise Exception('Invalid Input: Not Boolean')

    def type(self):
        return Bool
