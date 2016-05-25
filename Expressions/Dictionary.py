from Expressions.Addresable import Addressable
from Expressions.Nil import Nil

class Dictionary(Addressable):

    def __init__(self, dict):
        self.dict = dict

    def eval(self):
        return self.dict

    def set(self, property, value):
        self.dict[property] = value

    def get(self, property):
        if property in self.dict.keys():
            return self.dict[property]
        return Nil()

    def to_cli(self):
        stringified = {}
        for key in self.dict.keys():
            stringified[key] = self.dict[key].to_cli()
        return str(stringified) + " (Dictionary)"