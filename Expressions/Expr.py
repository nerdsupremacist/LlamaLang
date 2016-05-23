class Expr(object):

    def __init__(self, text):
        self.text = text

    def eval(self):
        # Parse Text Here
        return self.text

    def type(self):
        return Expr

    def to_cli(self):
        return self.eval()
