from Expressions.Addresable import Addressable
from Expressions.Nil import Nil

class Array(Addressable):

    def __init__(self, items):
        self.items = items

    def eval(self):
        return self.items

    def get(self, property):
        if property < len(self.items):
            return self.items[property]
        raise Exception("Index Out Of Bounds")

    def set(self, property, value):
        self.items[property] = value

    def head(self):
        if len(self.items) > 0:
            return self.items[0]
        return Nil()

    def to_cli(self):
        stringified = []
        for i in self.items:
            stringified.append(i.eval())
        return str(stringified) + " (Array)"

    @staticmethod
    def empty():
        return Array([])