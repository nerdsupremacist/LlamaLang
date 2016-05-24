from AbstractContext import AbstractContext
class EmptyContext(AbstractContext):
    def __init__(self):
        return

    def valueForVar(self, name):
        raise Exception("Unknown Variable " + name)

    def setValueForVar(self, name, ex):
        raise Exception("Unknown Variable " + name)

    def typeForVar(self, name):
        raise Exception("Unknown Variable " + name)
