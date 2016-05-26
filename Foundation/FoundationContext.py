import Context
from EmptyContext import EmptyContext
from Expressions.Operations.Function import Function
from Foundation.PrintFunction import Print

class FoundationContext(Context.Context):

    def __init__(self, parent_context):
        self.types = { "print": Function }
        self.values = { "print": Print(self) }
        self.parent_context = parent_context

    @staticmethod
    def simple():
        return FoundationContext(EmptyContext())