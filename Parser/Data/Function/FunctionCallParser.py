from Parser.Parser import Parser
from Expressions.Operations.Function import Function
from Expressions.Var import Var
import re

class FunctionCallParser(Parser):

    def __init__(self, text, context):
        super(FunctionCallParser, self).__init__(text, context)
        self.internal += [self.parse_call]

    def parse_call(self):
        pattern = re.compile("[ ]+")
        expressions_as_string_array = pattern.split(self.text)
        expressions_as_array = []
        if len(expressions_as_string_array) > 1:
            for expression_as_string in expressions_as_string_array:
                from Parser.StandardParser import StandardParser
                parser = StandardParser(expression_as_string, self.context)
                parsed = parser.parse()
                if parsed is None:
                    return None
                expressions_as_array.append(parsed)
            if len(expressions_as_array) > 0 and expressions_as_array[0].type() == Function:
                func = expressions_as_array[0]
                params = expressions_as_array[1:]
                if isinstance(func, Var):
                    func = func.get()
                func.apply(params)
                self.finish()
                return func.get()
        return None
