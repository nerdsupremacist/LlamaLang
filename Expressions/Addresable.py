from Expressions.Expr import Expr

class Addressable(Expr):

    def __init__(self):
        return

    def get(self, property):
        raise "Addressing not implemented in instance"

    def set(self, property, value):
        raise "Addresing not implemented in instance"

    def type(self):
        return Addressable