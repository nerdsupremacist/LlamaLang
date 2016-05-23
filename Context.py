class Context(object):

    def __init__(self):
        self.values = {}
        self.types = {}

    def valueForVar(self, name):
        if name in self.types.keys():
            return self.values[name]
        else:
            raise Exception("Unknown Variable " + name)
        
    def setValueForVar(self, name, ex):
        if name in self.values.keys():
            if self.types[name] == ex.type():
                self.values[name] = ex.eval()
            else:
                raise Exception("Type Error! " + name + " cannot conform to " + expr.type())
        else:
            self.types[name] = ex.type()
            self.values[name] = ex

    def typeForVar(self, name):
        if name in self.types.keys():
            return self.types[name]
        else:
            raise Exception("Unknown Variable " + name)
