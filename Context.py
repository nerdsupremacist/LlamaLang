from AbstractContext import AbstractContext
from EmptyContext import EmptyContext

class Context(AbstractContext):

    @staticmethod
    def simple():
        item = Context(EmptyContext())
        return item

    def __init__(self, parent_context):
        self.values = {}
        self.types = {}
        self.parent_context = parent_context

    def valueForVar(self, name):
        if name in self.types.keys():
            value = self.values[name]
            return value.min()
        else:
            return self.parent_context.valueForVar(name)
        
    def setValueForVar(self, name, ex):
        if name in self.values.keys():
            raise Exception("Variable already set.")
        else:
            self.types[name] = ex.type()
            self.values[name] = ex.min()

    def typeForVar(self, name):
        if name in self.types.keys():
            return self.types[name]
        else:
            return self.parent_context.typeForVar(name)
