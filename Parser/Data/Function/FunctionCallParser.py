from Parser.Parser import Parser
from Parser.Data.VariableParser import VariableParser
from Expressions.Operations.Function import Function

class FunctionCallParser(Parser):

    def __init__(self, text, context):
        super(FunctionCallParser, self).__init__(text, context)
        self.internal += [self.parse_call]

    def parse_call(self):
        vars_as_string_array = self.text.split("[ ]+")
        vars_as_array = []
        for var_as_string in vars_as_string_array:
            parser = VariableParser(self.text, self.context)
            parsed = parser.parse()
            if parsed is None:
                return None
            vars_as_array.append(parsed.parsedObject)
        if len(vars_as_array) > 0 and vars_as_array[0].type() == Function:
            func = vars_as_array[0]
            params = vars_as_array[1:]
            func.apply(params)
            return func.min()
        return None
