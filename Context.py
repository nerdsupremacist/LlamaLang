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
            return value.copy()
        else:
            raise Exception("Unknown Variable " + name)
        
    def setValueForVar(self, name, ex):
        if name in self.values.keys():
            if self.types[name] == ex.type():
                self.values[name] = ex.eval()
            else:
                raise Exception("Type Error! " + name + " cannot conform to " + ex.type())
        else:
            self.types[name] = ex.type()
            self.values[name] = ex

    def typeForVar(self, name):
        if name in self.types.keys():
            return self.types[name]
        else:
            return None
