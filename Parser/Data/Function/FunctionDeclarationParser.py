from Parser.Parser import Parser
from Expressions.Operations.Function import Function
import re

class FunctionDeclarationParser(Parser):
    
    def __init__(self, text, context):
        super(FunctionDeclarationParser, self).__init__(text, context)
        self.internal += [self.parse_declaration]

    def parse_declaration(self):
        index = self.text.find("->")
        if index > 0:
            vars_as_string = self.text[:index-1]
            pattern = re.compile("[ ]+")
            vars_as_array = pattern.split(vars_as_string)
            vars_as_array.remove("")
            for item in vars_as_array:
                if not item.isalpha:
                    return None
            code = self.text[index+2:]
            self.finish()
            return Function(vars_as_array, self.context, code, False)
